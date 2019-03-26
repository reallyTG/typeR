library(mev)


### Name: egp2.fit
### Title: Fit an extended generalized Pareto distribution of Naveau et al.
### Aliases: egp2.fit

### ** Examples

## No test: 
library(ismev)
data(rain)
egp2.fit(rain[rain>0], model=1, method="mle", init=c(0.9, gp.fit(rain,0, show=FALSE)$est),
 rounded=0.1,CI=TRUE, R=20)
## End(No test)



