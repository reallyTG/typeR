library(RHawkes)


### Name: mllRH
### Title: Minus loglikelihood of a RHawkes model
### Aliases: mllRH
### Keywords: RHawkes likelihood

### ** Examples

    ## simulate data from a RHawkes process (Hawkes, by the defaulting
    ## parameters)
    set.seed(1)
    ce <- 50;
    tms <- simRHawkes(cens=ce,par.redist=list(shape=1,scale=1.5),branching.ratio=0.3)
    ## calculate the MLE when data is treated as Hawkes process event
    ## times on [0,ce]
    sim.est0 <- optim(c(1.5,1,0.3),
                      function(p){
                          mloglik1d(jtms=tms,TT=ce,
                                    nu=function(x){rep(1/p[1],length(x))},
                                    gcoef=c(p[3]*p[2],p[2]),
                                    Inu=function(x){x/p[1]})
                      },
                      control=list(maxit=5000,trace=TRUE,reltol=1e-9),
                      )
    ## calculate the MLE when data is treated as RHawkes process event
    ## times on [0,ce]
    sim.est1 <- optim(c(1,sim.est0$par),
                      mllRH,tms=tms,cens=ce,
                      control=list(maxit = 5000, trace = TRUE,reltol=1e-9),
                      hessian=TRUE)
    sim.est1$par
## No test: 
## earthquake times over 96 years
data(quake);
tms <- sort(quake$time);
# add some random noise to the simultaneous occuring event times
tms[213:214] <- tms[213:214] + 
                    sort(c(runif(1, -1, 1)/(24*60), runif(1, -1, 1)/(24*60)))


## calculate the minus loglikelihood of an RHawkes with some parameters 
## the default hazard function and density functions are Weibull and 
## exponential respectivley
mllRH(tms, cens = 96*365.25 , par = c(0.5, 20, 1000, 0.5))
## calculate the MLE for the parameter assuming known parametric forms
## of the immigrant hazard function and offspring density functions.  
system.time(est <- optim(c(0.5, 20, 1000, 0.5), 
                        mllRH, tms = tms, cens = 96*365.25,
                        control = list(maxit = 5000, trace = TRUE),
                        hessian = TRUE)
            )
## point estimate by MLE
est$par
## standard error estimates:
diag(solve(est$hessian))^0.5
## End(No test)
## Not run: 
##D     set.seed(1)
##D     ce <- 2000;
##D     tms <- simRHawkes(cens=ce,par.redist=list(shape=1,scale=2),branching.ratio=0.4)
##D     ## calculate the MLE when data is treated as Hawkes process event
##D     ## times on [0,ce]
##D     sim.est0 <- optim(c(2,1,0.4),
##D                       function(p){
##D                           mloglik1d(jtms=tms,TT=ce,
##D                                     nu=function(x){rep(1/p[1],length(x))},
##D                                     gcoef=c(p[3]*p[2],p[2]),
##D                                     Inu=function(x){x/p[1]})
##D                       },
##D                       control=list(maxit=5000,trace=TRUE,reltol=1e-9),
##D                       )
##D     ## calculate the MLE when data is treated as Weibull RHawkes
##D     ## process event times on [0,ce]
##D     system.time(sim.est1 <- optim(c(1,sim.est0$par),
##D                       mllRH,tms=tms,cens=ce,
##D                       control=list(maxit = 5000, trace = TRUE,reltol=1e-9),
##D                       hessian=TRUE))
##D     sim.est1$par
## End(Not run)



