library(lifecontingencies)


### Name: decreasingAnnuity
### Title: Function to evaluate decreasing annuities.
### Aliases: decreasingAnnuity

### ** Examples

	#the present value of 10, 9, 8,....,0 payable at the end of the period
	#for 10 years is
	decreasingAnnuity(i=0.03, n=10)
	#assuming a 3% interest rate
	#should be
	sum((10:1)/(1+.03)^(1:10))



