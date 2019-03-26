library(BivRegBLS)


### Name: GraphFullCIs.XY
### Title: Plot all the DR and BLS potential solutions
### Aliases: GraphFullCIs.XY
### Keywords: Deming Regression DR Bivariate Least Square regression BLS
###   ellipse confidence region

### ** Examples

library(BivRegBLS)
data(SBP)
# Estimate all the solutions with the DR and BLS regressions
res.full=FullCIs.XY(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Estimate the BLS regression with replicated data
res.BLS=BLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Estimate the measurement error variances ratio
res.lambda=lambdas(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Plot all the results with all the potential solutions
#   and superimpose the BLS regression estimated with replicated data
GraphFullCIs.XY(FullCIs=res.full,BLS.estimate=res.BLS,lambda=res.lambda,
                xname="J",yname="S",graph="all",accept.int=10,accept.int.perc=FALSE,include.H0=TRUE)
# Plot all the potential solutions for the confidence intervals and add two acceptance intervals
GraphFullCIs.XY(FullCIs=res.full,xname="J",yname="S",graph="CI",
                accept.int=c(8,12),accept.int.threshold=150,accept.int.perc=FALSE,include.H0=TRUE)
data(Aromatics)
# Estimate all the solutions with the BLS regression
res.full=FullCIs.XY(data=Aromatics,xcol=3,ycol=4)
# Plot all the potential solutions for the confidence regions (ellipses)
GraphFullCIs.XY(FullCIs=res.full,xname="HPLC",yname="GC MS",graph="joint.ellipse")



