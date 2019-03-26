library(ARCensReg)


### Name: ARCensReg
### Title: Censored Linear Regression Model with Autoregressive Errors
### Aliases: ARCensReg
### Keywords: package censored regression autoregressive errors

### ** Examples

##simple example (p = l = 1)
#generating a sample
set.seed(23451)
n=50
x=rep(1,n)
dat = rARCens(n=n,beta=2,pit=.5,sig2=.3,x=x,
                cens='left',pcens=.1)

#fitting the model (quick convergence)
fit0 = ARCensReg(dat$data$cc,dat$data$y,x,tol=0.001,
                  pc=.12,M=5,show_se=FALSE)

## Not run: 
##D 
##D ##another example (p = l = 2)
##D #generating a sample
##D n=100
##D x=cbind(1,runif(n))
##D dat = rARCens(n=n,beta=c(2,1),pit=c(.4,-.2),sig2=.5,
##D                     x=x,cens='left',pcens=.05)
##D 
##D #fitting the model
##D fit1 = ARCensReg(dat$data$cc,dat$data$y,x,p=2,
##D                       cens="left",tol=0.0001)
##D 
##D #plotting the augmented variable
##D par(mfrow=c(1,1))
##D plot.ts(fit1$yest,lty='dashed',col=4)
##D lines(dat$data$y)
##D 
##D #simulating missing values
##D miss = sample(1:n,3)
##D yMISS = dat$data$y
##D yMISS[miss] = NA
##D fit2 = ARCensReg(dat$data$cc,yMISS,x,p=2,miss=miss,
##D                 cens="left",tol=0.0001)
##D 
## End(Not run)



