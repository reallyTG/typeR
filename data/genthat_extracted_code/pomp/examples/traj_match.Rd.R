library(pomp)


### Name: Trajectory matching
### Title: Parameter estimation by fitting the trajectory of a model's
###   deterministic skeleton to data
### Aliases: 'Trajectory matching' traj.match traj.match-pomp
###   traj.match,ANY-method traj.match,missing-method
###   traj.match,pomp-method traj.match-traj.matched.pomp
###   traj.match,traj.matched.pomp-method logLik,traj.matched.pomp-method
###   logLik-traj.matched.pomp $,traj.matched.pomp-method
###   $-traj.matched.pomp summary,traj.matched.pomp-method
###   summary-traj.matched.pomp traj.matched.pomp-class traj.match.objfun
###   traj.match.objfun-pomp traj.match.objfun,ANY-method
###   traj.match.objfun,missing-method traj.match.objfun,pomp-method
### Keywords: optimize ts

### ** Examples

pompExample(ou2)
true.p <- c(
    alpha.1=0.9,alpha.2=0,alpha.3=-0.4,alpha.4=0.99,
    sigma.1=2,sigma.2=0.1,sigma.3=2,
    tau=1,
    x1.0=50,x2.0=-50
)
simdata <- simulate(ou2,nsim=1,params=true.p,seed=43553)
guess.p <- true.p
res <- traj.match(
    simdata,
    start=guess.p,
    est=c('alpha.1','alpha.3','alpha.4','x1.0','x2.0','tau'),
    maxit=2000,
    method="Nelder-Mead",
    reltol=1e-8
)

summary(res)

plot(range(time(res)),range(c(obs(res),states(res))),type='n',xlab="time",ylab="x,y")
points(y1~time,data=as(res,"data.frame"),col='blue')
points(y2~time,data=as(res,"data.frame"),col='red')
lines(x1~time,data=as(res,"data.frame"),col='blue')
lines(x2~time,data=as(res,"data.frame"),col='red')

## Not run: 
##D res1 <- traj.match(
##D     simdata,
##D     start=guess.p,
##D     est=c('alpha.1','alpha.3','alpha.4','x1.0','x2.0','tau'),
##D     maxit=2000,
##D     method="nloptr",
##D     algorithm="NLOPT_LN_SBPLX",
##D     xtol_rel=1e-5, maxeval=1e5
##D )
##D 
##D summary(res1)
## End(Not run)

pompExample(ricker)
ofun <- traj.match.objfun(ricker,est=c("r","phi"),transform=TRUE)
optim(fn=ofun,par=c(2,0),method="BFGS")

pompExample(bbs)
## some options are passed to the ODE integrator
ofun <- traj.match.objfun(bbs,est=c("Beta","gamma"),transform=TRUE,hmax=0.001,rtol=1e-6)
optim(fn=ofun,par=c(0,-1),method="Nelder-Mead",control=list(reltol=1e-10))



