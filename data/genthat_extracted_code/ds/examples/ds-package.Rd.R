library(ds)


### Name: ds-package
### Title: Descriptive Statistics
### Aliases: ds-package ds

### ** Examples

	# Example of weights and heart girths of cows. 
	# Weight was measured in kg and heart girth in cm on 10 cows (Kaps and Lamberson, 2009).
	Weight=c(641, 620, 633, 651, 640, 666, 650, 688, 680, 670) 
	Heart_girth=c(205, 212, 213, 216, 216, 217, 218, 219, 221, 226)

	data=data.frame(Weight,Heart_girth)

	r1<-dscor(data)
	r1

	r2<-dscor(data, option=2)
	r2

	r3<-dscor(data, method=2, option=1)
	r3

	r4<-dscor(data, method=2, option=2)
	r4

	r5<-gds(data)
	r5






