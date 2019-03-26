library(stratification)


### Name: var.strata
### Title: Anticipated Variances and RRMSE from a Stratified Design for a
###   Survey Variable Y
### Aliases: var.strata print.var.strata
### Keywords: survey

### ** Examples

nomodel <- strata.LH(x=Sweden$REV84, CV=0.05, Ls=3, alloc=c(0.5,0,0.5),
          takeall=1, model="none")
# We can give a vector of the Y values for every unit in the population
var.strata(nomodel, y=Sweden$RMT85) 
# Or specify a model between X and Y
var.strata(nomodel, model="loglinear", model.control=list(beta=1.058355,
           sig2=0.06593083, ph=1))
# Compared to taking into account the model in the optimization
model <- strata.LH(x=Sweden$REV84, CV=0.05, Ls=3, alloc=c(0.5,0,0.5),
         takeall=1, model="loglinear", model.control=list(beta=1.058355,
		     sig2=0.06593083, ph=1))
var.strata(model, y=Sweden$RMT85)

### Examples of posterior correction for non-response
LH <- strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1)
LH
# Without non-response in the take-all strata
var.strata(LH, rh.postcorr=TRUE, rh=c(0.85,0.9,0.9,1))
strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1, rh=c(0.85,0.9,0.9,1))
# With non-response in the take-all strata
var.strata(LH, rh.postcorr=TRUE, rh=0.9)
strata.LH(x=MRTS, CV=0.01, Ls=4, alloc=c(0.5,0,0.5), takeall=1, rh=0.9)



