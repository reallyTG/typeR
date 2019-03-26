library(VNM)


### Name: Deff
### Title: Checking D-efficiency for estimating model parameters.
### Aliases: Deff

### ** Examples

	##The given design
	dose=c(-6.91,-4.89,-4.18,6.91)
	weight=c(.344,.323,.162,.171)
	
	##Model parameter values for the 4PL
	par.4PL=c(0.137,1.563,.00895,-1.790)
	
	##Check D-efficiency of the given design and its verification plot
	Res.D=Deff(weight, P=par.4PL, dose, LB=log(.001), UB=log(1000))
	summary(Res.D)
	plot(Res.D)



