library(ds)


### Name: dscor
### Title: Descriptive Statistics (correlations)
### Aliases: dscor

### ** Examples

	# Example of weights and heart girths of cows. 
	# Weight was measured in kg and heart girth in cm on 10 cows (Kaps and Lamberson, 2009).

	Weight=c(641, 620, 633, 651, 640, 666, 650, 688, 680, 670) 
	Heart_girth=c(205, 212, 213, 216, 216, 217, 218, 219, 221, 226)

	data=data.frame(Weight,Heart_girth)
	
	#Pearson (table)
	r1<-dscor(data)
	r1
	
	# Pearson (matrix)
	r2<-dscor(data, option=2)
	r2

	# Spearman (table)
	r3<-dscor(data, method=2, option=1)
	r3

	# Spearman (matrix)
	r4<-dscor(data, method=2, option=2)
	r4

	# fictional example

	var1=c(10,13,14,16,18,22,29,28,35)
	var2=c(0.5,1,1.5,2,2.5,3,3.5,4,4.5)
	var3=c(102,NA,106,91,109,108,120,101,NA)
	var4=c(500,456,423,378,312,263,200,120,50)
	var5=c(18,09,22,NA,26,59,10,NA,96)

	table=data.frame(var1,var2,var3,var4,var5)

	#Pearson 
	r5<-dscor(table)
	r5
	
	r6<-dscor(table, option=2)
	r6
		
	# Spearman
	r7<-dscor(table, method=2, option=1)
	r7
	
	r8<-dscor(table, method=2, option=2)
	r8

	



