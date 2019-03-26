library(assist)


### Name: intervals.nnr
### Title: Calculate Predictions and Approximate Posterior Standard
###   Deviations for Spline Estimates From a nnr Object
### Aliases: intervals.nnr
### Keywords: file

### ** Examples


## fit a generalized varying coefficient models
data(Arosa)
Arosa$csmonth <- (Arosa$month-0.5)/12
Arosa$csyear <- (Arosa$year-1)/45
ozone.fit <- nnr(thick~f1(csyear)+exp(f2(csyear))*f3(csmonth),
        func=list(f1(x)~list(~I(x-.5),cubic(x)), f2(x)~list(~I(x-.5)-1,cubic(x)),
        f3(x)~list(~sin(2*pi*x)+cos(2*pi*x)-1,lspline(x,type="sine0"))),
        data=Arosa[Arosa$year%%2==1,], spar="m", start=list(f1=mean(thick),f2=0,f3=sin(csmonth)),
	control=list(backfit=1))

x <- seq(0,1,len=50)
u <- seq(0,1,len=50)

## calculate Bayesian confidence limits for all components of all functions
p.ozone.fit <- intervals(ozone.fit, newdata=list(csyear=x,csmonth=u),
                 terms=list(f1=matrix(c(1,1,1,1,1,0,0,0,1),nrow=3,byrow=TRUE),
	                    f2=matrix(c(1,1,1,0,0,1),nrow=3,byrow=TRUE),
                            f3=matrix(c(1,1,1,1,1,0,0,0,1),nrow=3,byrow=TRUE)))	
## Not run: plot(p.ozone.fit, x.val=x)



