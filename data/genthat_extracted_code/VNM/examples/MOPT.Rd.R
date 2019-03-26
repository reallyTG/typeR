library(VNM)


### Name: MOPT
### Title: Search the 3-objective optimal designs for estimating model
###   parameters, ED50, and MED.
### Aliases: MOPT

### ** Examples

	##Model parameter values for the 4PL
	par.4PL=c(0.137,1.563,.00895,-1.790)
	
	##Find the 3-objective optimal design for the 4PL model
	Res.M=MOPT(LB=log(.001), UB=log(1000), par.4PL, lambda=c(1/3,1/3), delta=-1, r=30)
	
	##Generated the 3-objective optimal design
	summary(Res.M)
	
	##Verification plot of the generated design
	plot(Res.M)



