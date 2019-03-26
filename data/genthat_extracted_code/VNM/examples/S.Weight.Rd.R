library(VNM)


### Name: S.Weight
### Title: Identify optimal weights for given dose levels.
### Aliases: S.Weight

### ** Examples

	##The given dose levels
	dose=c(-6.91,-4.89,-4.18,6.91)
	
	##Model parameter values for the 4PL
	par.4PL=c(0.137,1.563,.00895,-1.790)
	
	##Find the optimal weights for the given dose levels
	Res.W=S.Weight(dose, par.4PL, lambda=c(1/3,1/3), delta=-1)
	
	##Print the obtained optimal weights, and its verification
    summary(Res.W)



