library(BivRegBLS)


### Name: GraphFullCIs.MD
### Title: Plot all the CBLS potential solutions
### Aliases: GraphFullCIs.MD
### Keywords: Correlated Bivariate Least Square regression CBLS Bivariate
###   Least Square regression BLS ellipse confidence region

### ** Examples

library(BivRegBLS)
data(SBP)
# Estimate all the solutions with the CBLS regression
res.full=FullCIs.MD(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Estimate the CBLS regression with replicated data
res.CBLS=CBLS(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Estimate the measurement error variances ratio
res.lambda=lambdas(data=SBP,xcol=c("J1","J2","J3"),ycol=8:10)
# Plot all the results with all the potential solutions
#   and superimpose the CBLS regression estimated with replicated data
GraphFullCIs.MD(FullCIs=res.full,CBLS.estimate=res.CBLS,lambda=res.lambda,
                xname="J",yname="S",graph="all",accept.int=10,accept.int.perc=FALSE,include.H0=TRUE)
data(Aromatics)
# Estimate all the solutions with the CBLS regression
res.full=FullCIs.MD(data=Aromatics,xcol=3,ycol=4)
# Plot all the potential solutions for the confidence regions (ellipses)
GraphFullCIs.MD(FullCIs=res.full,xname="HPLC",yname="GC MS",graph="joint.ellipse")
# Plot all the potential solutions for the confidence intervals and add two acceptance intervals
GraphFullCIs.MD(FullCIs=res.full,xname="HPLC",yname="GC MS",graph="CI",
                accept.int=c(0.1,0.2),accept.int.threshold=15)



