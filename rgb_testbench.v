`timescale 1ns / 1ps

module rgb_testbench;

	// Inputs
	reg Mode;
	reg [3:0] Address;
	reg [23:0] RGBin;
	reg [2:0] Op;
	reg CLK;
	wire [23:0] RGBout;

	integer testCounter;

	// Instantiate the Unit Under Test (UUT)
	RgbMaskModule uut (
		.Mode(Mode),
		.Address(Address),
		.RGBin(RGBin),
		.Op(Op),
		.CLK(CLK),
		.RGBout(RGBout)
	);
    // At 3, 9, 15, Clock RISES 
    // At 6, 12, 18, .. Clock FALLS
   initial CLK = 0;
	always #3 CLK = ~CLK;
    
	initial begin
		$monitor("TIME=%t | Mode=%b Addres=%b RGBin=%b Op=%b | RGBout=%b",
					 $time,   Mode,Address,RGBin,Op,RGBout);
		// Initialize Inputs
		Mode = 1'b1;
		Address = 4'b1010;
		RGBin = 24'b100000011100001101000010;
		Op = 3'b000;
		// Initialize testCount variables:
		testCounter = 0;
		
		// Wait 4 ns for first rising clk
		#4; //t = 4
      Mode = 1'b0;
		#6;
		//Test1: Initial
		if ((RGBout == 24'b100000001000001000000010)) begin $display("Test1: Passed"); testCounter = testCounter + 1; end
		else $display("Test1 failed.");
		#3; // Wait for low clock to change inputs.
		//Initialize Test 2
		RGBin = 24'b100000011100001101000010;
		Op = 3'b001;
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b101001111110011111100110)) begin $display("Test2: Passed"); testCounter = testCounter + 1; end
		else $display("Test2 failed.");
		#3; // Wait for low clock to change inputs.
		//Initialize Test 3
		RGBin = 24'b100000011100001101000010;
		Op = 3'b010;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b001001110110010111100100)) begin $display("Test3: Passed"); testCounter = testCounter + 1; end
		else $display("Test3 failed.");
		#3; // Wait for low clock to change inputs.		
		//Initialize Test 4
		RGBin = 24'b100000011100001101000010;
		Op = 3'b011;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b111111111111111111101000)) begin $display("Test4: Passed"); testCounter = testCounter + 1; end
		else $display("Test4 failed.");
		#3; // Wait for low clock to change inputs.		
		//Initialize Test 5
		RGBin = 24'b100000011100001101000010;
		Op = 3'b100;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b000000000001110100000000)) begin $display("Test5: Passed"); testCounter = testCounter + 1; end
		else $display("Test5 failed.");
		#3; // Wait for low clock to change inputs.		
		//Initialize Test 6
		RGBin = 24'b100000011100001101000010;
		Op = 3'b101;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b100000101100010001000011)) begin $display("Test6: Passed"); testCounter = testCounter + 1; end
		else $display("Test6 failed.");
		#3; // Wait for low clock to change inputs.		
		//Initialize Test 7
		RGBin = 24'b100000011100001101000010;
		Op = 3'b110;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b100000001100001001000001)) begin $display("Test7: Passed"); testCounter = testCounter + 1; end
		else $display("Test7 failed.");
		#3; // Wait for low clock to change inputs.		
		//Initialize Test 8
		RGBin = 24'b100000011100001101000010;
		Op = 3'b111;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b000000111000011110000100)) begin $display("Test8: Passed"); testCounter = testCounter + 1; end
		else $display("Test8 failed.");
		#3; // Wait for low clock to change inputs.	
        
        Address = 4'b1110;
        
        //Initialize Test 9
		RGBin = 24'b011000110110010101100111;
		Op = 3'b000;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b010000110100000101000011)) begin $display("Test9: Passed"); testCounter = testCounter + 1; end
		else $display("Test9 failed.");
		#3; // Wait for low clock to change inputs.		
        //Initialize Test 10
		RGBin = 24'b011000110110010101100111;
		Op = 3'b001;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b111100111111011111110111)) begin $display("Test10: Passed"); testCounter = testCounter + 1; end
		else $display("Test10 failed.");
		#3; // Wait for low clock to change inputs.		
        //Initialize Test 11
		RGBin = 24'b011000110110010101100111;
		Op = 3'b010;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b101100001011011010110100)) begin $display("Test11: Passed"); testCounter = testCounter + 1; end
		else $display("Test11 failed.");
		#3; // Wait for low clock to change inputs.		
        //Initialize Test 12
		RGBin = 24'b011000110110010101100111;
		Op = 3'b011;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b111111111111111111111111)) begin $display("Test12: Passed"); testCounter = testCounter + 1; end
		else $display("Test12 failed.");
		#3; // Wait for low clock to change inputs.	
        //Initialize Test 13
		RGBin = 24'b011000110110010101100111;
		Op = 3'b100;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b000000000000000000000000)) begin $display("Test13: Passed"); testCounter = testCounter + 1; end
		else $display("Test13 failed.");
		#3; // Wait for low clock to change inputs.	
        //Initialize Test 14
		RGBin = 24'b011000110110010101100111;
		Op = 3'b101;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b011001000110011001101000)) begin $display("Test14: Passed"); testCounter = testCounter + 1; end
		else $display("Test14 failed.");
		#3; // Wait for low clock to change inputs.	
        //Initialize Test 15
		RGBin = 24'b011000110110010101100111;
		Op = 3'b110;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b011000100110010001100110)) begin $display("Test15: Passed"); testCounter = testCounter + 1; end
		else $display("Test15 failed.");
		#3; // Wait for low clock to change inputs.	
        //Initialize Test 16
		RGBin = 24'b011000110110010101100111;
		Op = 3'b111;			
		Mode = 1'b1;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b110001101100101011001110)) begin $display("Test16: Passed"); testCounter = testCounter + 1; end
		else $display("Test16 failed.");
		#3; // Wait for low clock to change inputs.	
		    //Initialize Test 17
		RGBin = 24'b011100100111011001100010;
		Op = 3'b011;			
		Mode = 1'b1;
		Address = 4'b0000;
		#6;
		RGBin = 24'b011110010110001101111001;
		Op = 3'b101;
		Address = 4'b0101;
		#3; // Wait for clk rise to check inputs.
		Mode = 1'b0;
		#6;
		if ((RGBout == 24'b011110100110010001111010))
        begin
			Address = 4'b0000;
			#6;
			if((RGBout == 24'b011100100111011001100010)) begin $display("Test17: Passed"); testCounter = testCounter + 1; end
			else $display("Test17 failed.");
		end
		else $display("Test17 failed.");
		#3; // Wait for low clock to change inputs.	


		$display("Test results: %d / 17", testCounter);
		
		/* ADD ADDITIONAL TEST CASES HERE */
		
        
		/* ADDITIONAL TEST CASES END */
		$finish;
	end
      
endmodule
