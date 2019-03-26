library(nlsrk)


### Name: frunge
### Title: Numeric solution of an ODE (univariate)
### Aliases: frunge
### Keywords: nonlinear

### ** Examples

	v<-frunge(t=seq(0,50,0.5), param=c(r=0.1,k=100), y0=3, Dfdt = dfdt, dt = 0.01, graph = TRUE)
        plot(seq(0,50,0.5),v)
## 
##     Example of model fitting with frunge. a : determined initial condition 
##
data(logis)
attach(logis)
nls(y~frunge(time,c(r,k),y0=3,dfdt,graph=FALSE),data=logis,start=list(r=0.05,k=100),trace=TRUE)->m1
plot(time,y)
lines(time,fitted(m1))
summary(m1)
detach(logis)
## 
##     Example of model fitting with frunge. b : unknown initial condition ; 
##     y0 is fitted as a parameter

## Not run: 
##D data(logis)
##D attach(logis)
##D nls(y~frunge(time,c(r,k,y0),y0,dfdt,graph=FALSE),data=logis,start=list(r=0.05,k=100,y0=y[1]),
##D     trace=TRUE)->m2
##D plot(time,y)
##D lines(time,fitted(m2))
##D summary(m1)
##D detach(logis)
## End(Not run)




