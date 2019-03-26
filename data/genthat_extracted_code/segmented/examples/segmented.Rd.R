library(segmented)


### Name: segmented
### Title: Segmented relationships in regression models
### Aliases: segmented segmented.lm segmented.glm segmented.default
###   segmented.Arima
### Keywords: regression nonlinear

### ** Examples


set.seed(12)
xx<-1:100
zz<-runif(100)
yy<-2+1.5*pmax(xx-35,0)-1.5*pmax(xx-70,0)+15*pmax(zz-.5,0)+rnorm(100,0,2)
dati<-data.frame(x=xx,y=yy,z=zz)
out.lm<-lm(y~x,data=dati)

#simple example: 1 segmented variable, 1 breakpoint: you do not need to specify 
# the starting value for psi
o<-segmented(out.lm,seg.Z=~z)

#1 segmented variable, 2 breakpoints: you have to specify starting values (vector) for psi:
o<-segmented(out.lm,seg.Z=~x,psi=c(30,60),
    control=seg.control(display=FALSE))
slope(o)

#2 segmented variables: starting values requested via a named list
out.lm<-lm(y~z,data=dati)
o1<-update(o,seg.Z=~x+z,psi=list(x=c(30,60),z=.3))


#the default method leads to the same results (but it is slower)
#o1<-segmented.default(out.lm,seg.Z=~x+z,psi=list(x=c(30,60),z=.3))
#o1<-segmented.default(out.lm,seg.Z=~x+z,psi=list(x=c(30,60),z=.3), 
#    control=seg.control(fn.obj="sum(x$residuals^2)"))


#automatic procedure to estimate breakpoints in the covariate x
# Notice: bootstrap restart is not allowed!
o<-segmented.lm(out.lm,seg.Z=~x+z,psi=list(x=NA,z=.3), 
    control=seg.control(stop.if.error=FALSE,n.boot=0, it.max=20))

#assess the progress of the breakpoint estimates throughout the iterations
## Not run: 
##D par(mfrow=c(2,1))
##D draw.history(o, "x")
##D draw.history(o, "z")
## End(Not run)
#try to increase the number of iterations and re-assess the 
#convergence diagnostics 


#An example using the default method:
# Cox regression with a segmented relationship  
## Not run: 
##D library(survival)
##D data(stanford2)
##D 
##D o<-coxph(Surv(time, status)~age, data=stanford2)
##D os<-segmented(o, ~age, psi=40) #estimate the breakpoint in the age effect
##D summary(os) #actually it means summary.coxph(os)
##D plot(os) #it does not work
##D plot.segmented(os) #call explicitly plot.segmented() to plot the fitted piecewise lines
## End(Not run)
            



