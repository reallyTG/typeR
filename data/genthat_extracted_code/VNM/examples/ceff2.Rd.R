library(VNM)


### Name: ceff2
### Title: Checking c-efficiency for estimating the MED.
### Aliases: ceff2

### ** Examples

	##The given design
	dose=c(-6.91,-4.89,-4.18,6.91)
	weight=c(.344,.323,.162,.171)
	
	##Model parameter values for the 4PL
	par.4PL=c(0.137,1.563,.00895,-1.790)
	
	##delta to define MED
	delta=-1
	
	##Check c-efficiency of the given design for estimating the MED and its verification plot 
	Res.c2=ceff2(weight, P=par.4PL, dose, LB=log(.001), UB=log(1000), delta, r=30)
	summary(Res.c2)
	plot(Res.c2)



