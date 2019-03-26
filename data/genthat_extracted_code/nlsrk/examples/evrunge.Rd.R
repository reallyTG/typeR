library(nlsrk)


### Name: evrunge
### Title: Numerical Runge-Kutta Solver (multi point, multivariate)
### Aliases: evrunge
### Keywords: nonlinear

### ** Examples

##
##	example 1 : solving and plotting the system sys provided in the package
##
data(syslin.don)
syslin<-prepare(syslin.don)
  evrunge(t=c(1:30),param=c(1,1),y0=c(1000,0),sys=sys,graph=TRUE)
##
##	example 2 : fitting by nls on data \code{syslin} fixed and known initial conditions
##
data(syslin)
attach(syslin)
nls(y~ evrunge(t,param=c(k1,k2),y0=c(1000,0),sys,graph=FALSE),data=syslin,start=list(k1=1,k2=1),
	trace=TRUE)->m1
summary(m1)
detach(syslin)
##
##	example 3 : fitting by nls on data syslin "unknown" initial conditions: 
##                  they have to be fitted as parameters
##
data(syslin)
nls(y~ evrunge(t,param=c(k1,k2,y0),y0,sys,graph=FALSE),data=syslin,start=list(k1=1,k2=1,
	y0=c(1000,0)),trace=TRUE)->m2
summary(m2)
plot.nlsrk(m2,syslin)
##
##	example 4 : fitting by nls on data syslin with known initial conditions: 
##                  There are no observations for the trajectory 1 which is not observable. 
##		    sys is unchanged
##
data(syslin)
##     We eliminate the data corresponding to trajectory 1 and fit only on trajectory 2. 
##     Fixed initial conditions
 syslin2<-syslin[syslin$traj==2,]
 attach(syslin2)
 nls(y~ evrunge(t,param=c(k1,k2),y0=c(1000,0),sys,graph=FALSE,observable=c(0,1)),data=syslin2,
     start=list(k1=1,k2=1),trace=TRUE)->m3
 summary(m3)
 plot.nlsrk(m3,syslin2)
 detach(syslin2)




