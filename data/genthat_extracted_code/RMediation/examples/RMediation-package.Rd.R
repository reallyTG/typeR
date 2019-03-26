library(RMediation)


### Name: RMediation-package
### Title: Mediation Analysis Confidence Intervals
### Aliases: RMediation-package
### Keywords: distribution regression

### ** Examples

medci(mu.x=.2,mu.y=.4,se.x=.1,se.y=.05,rho=0,alpha=.05)
pprodnormal(q=.4, mu.x=.5, mu.y=.3, se.x=.03, se.y=.08, rho= 0)
qprodnormal(p=.1, mu.x=.5, mu.y=.3, se.x=.03, se.y=.8, rho=0)
ci(mu=c(b1=0,b2=0),Sigma=c(1,2,10), quant=~b1*b2)
ci(mu=c(b1=1,b2=.7,b3=.6, b4= .45), Sigma=c(.05,0,0,0,.05,0,0, .03, 0, .03),
quant=~b1*b2*b3*b4, type="all", plot=TRUE, plotCI=TRUE)



