library(CompR)


### Name: ResSimulLvrRatio
### Title: Log Likelihood Ratio Test for Paired comparison data
### Aliases: ResSimulLvrRatio

### ** Examples

data(Cocktail)
ResCock1<-EstimBradley(Cocktail,Constraint=0,Tcla=1,eps=1e-04,eps1=1e-04,TestPi=TRUE)
Res_LvrRatio1<-ResSimulLvrRatio(Cocktail,ResCock1,0,3,level=0.05,eps=0.001,eps1=0.001)
getSimu(Res_LvrRatio1)
getTest(Res_LvrRatio1)



