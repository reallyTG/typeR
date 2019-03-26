library(ziphsmm)


### Name: fasthsmmfit
### Title: Fast gradient descent / stochastic gradient descent algorithm to
###   learn the parameters in a specialized zero-inflated hidden
###   semi-Markov model, where zero-inflation only happens in State 1. And
###   if there were covariates, they could only be the same ones for the
###   state-dependent log Poisson means and the logit structural zero
###   proportion. In addition, the dwell time distributions are
###   nonparametric for all hidden states.
### Aliases: fasthsmmfit

### ** Examples


#1. no covariates
set.seed(123)
prior_init <- c(0.5,0.2,0.3)
dt_init <- matrix(c(0.4,0.3,0.2,0.1,0.5,0.2,0.2,0.1,
                   0.25,0.25,0.25,0.25),3,4,byrow=TRUE)
emit_init <- c(10,50,100)
zeroprop <- c(0.6,0,0)
omega <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
sim1 <- hsmmsim(n=1000,M=3,prior=prior_init,dt_dist="nonparametric",
               dt_parm=dt_init, tpm_parm=omega,
               emit_parm=emit_init,zeroprop=zeroprop)
str(sim1)
y <- sim1$series


fitnost <- fasthsmmfit(y,NULL,NULL,3,trunc=c(4,4,4),
           dt_init=matrix(c(0.3,0.3,0.2,0.2,
           0.4,0.2,0.2,0.2,0.25,0.25,0.25,0.25),3,4,byrow=TRUE),
           prior_init=c(0.3,0.3,0.4),
           tpm_init=matrix(c(0,0.7,0.3,0.5,0,0.5,0.3,0.7,0),3,3,byrow=TRUE), 
           emit_init=c(8,40,80),zero_init=0.4,method="BFGS",control=list(trace=1))
           
decode1 <- hsmmviterbi(y, ntimes=NULL, 3, trunc=c(4,4,4), fitnost$prior, 
                      dt_dist="nonparametric", 
                      fitnost$dt, fitnost$tpm, 
                      fitnost$emit, c(fitnost$zeroprop,0,0))

#2. with covariates
dtparm <-  matrix(c(0.4,0.3,0.2,0.1,0.7,0.2,0.1,0,0.25,0.25,0.25,0.25),3,4,byrow=TRUE)
priorparm <- c(0,0)
zeroindex <- c(1,0,0)
zeroparm <- c(0,-1,1)
emitparm <- c(2,0.5,-0.5,3,0.3,-0.2,4,0.4,-0.4)
tpmparm <- c(-1,0,1)
workparm <- c(priorparm,zeroparm,emitparm,tpmparm) 
trunc <- c(4,3,4)

designx <- matrix(rnorm(4000),nrow=2000,ncol=2)
result <- hsmmsim2(workparm,3,2000,zeroindex,"nonparametric",
                  emit_x=designx,zeroinfl_x=designx,dt_x=dtparm)
y <- result$series

fitnost <- fasthsmmfit(y,designx,NULL,3,trunc=c(4,3,4),
           dt_init=matrix(c(0.3,0.3,0.2,0.2,0.4,0.2,0.2,0.2,
           0.25,0.25,0.25,0.25),3,4,byrow=TRUE),
           prior_init=c(0.3,0.3,0.4),
           tpm_init=matrix(c(0,0.8,0.2,0.4,0,0.6,0.2,0.8,0),3,3,byrow=TRUE), 
           emit_init=c(8,40,80),zero_init=0.4,method="BFGS",control=list(trace=1))

decode2 <- hsmmviterbi2(y,NULL,3,trunc=c(4,3,4),
                       fitnost$working_parm[-(1:8)],dt_x=fitnost$dt,
                       dt_dist="nonparametric", zero_init=c(1,0,0),
                       emit_x=designx,zeroinfl_x=designx)

#3. stochastic gradient descent without covariates
prior_init <- c(0.5,0.2,0.3)
dt_init <- matrix(c(0.4,0.3,0.2,0.1,0.5,0.2,0.2,0.1,
                   0.25,0.25,0.25,0.25),3,4,byrow=TRUE)
emit_init <- c(10,50,100)
zeroprop <- c(0.6,0,0)
omega <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
sim1 <- hsmmsim(n=50000,M=3,prior=prior_init,dt_dist="nonparametric",
               dt_parm=dt_init, tpm_parm=omega,
               emit_parm=emit_init,zeroprop=zeroprop)
y <- sim1$series

fitst <- fasthsmmfit(y,NULL,NULL,3,trunc=c(4,4,4),
         dt_init=matrix(c(0.4,0.3,0.2,0.1,0.4,0.2,0.2,0.2,
         0.25,0.25,0.25,0.25),3,4,byrow=TRUE),
         prior_init=c(0.3,0.3,0.4),
         tpm_init=matrix(c(0,0.8,0.2,0.5,0,0.5,0.2,0.8,0),3,3,byrow=TRUE), 
         emit_init=c(15,40,90),zero_init=0.4,stochastic=TRUE,
         nmin=500,nupdate=500,power=0.6,rate=c(0.5,0.08))
str(fitst)

#4. stochastic descent without covariates
dtparm <-  matrix(c(0.4,0.3,0.2,0.1,0.7,0.2,0.1,0,
           0.25,0.25,0.25,0.25),3,4,byrow=TRUE)
priorparm <- c(0,0)
zeroindex <- c(1,0,0)
zeroparm <- c(0,-0.5,0.5)
emitparm <- c(2,0.1,-0.1,3,0.3,-0.2,4,0.4,-0.4)
tpmparm <- c(-1,0,1)
workparm <- c(priorparm,zeroparm,emitparm,tpmparm) 
trunc <- c(4,3,4)

designx <- matrix(rnorm(100000),nrow=50000,ncol=2)
result <- hsmmsim2(workparm,3,50000,zeroindex,"nonparametric",
                  emit_x=designx,zeroinfl_x=designx,dt_x=dtparm)

y <- result$series

fitst <- fasthsmmfit(y,designx,NULL,3,trunc=c(4,3,4),
         dt_init=matrix(c(0.4,0.3,0.2,0.1,0.6,0.3,0.1,0,
         0.25,0.25,0.25,0.25),3,4,byrow=TRUE),
         prior_init=c(0.3,0.3,0.4),
         tpm_init=matrix(c(0,0.8,0.2,0.5,0,0.5,0.2,0.8,0),3,3,byrow=TRUE), 
         emit_init=c(15,40,90),zero_init=0.6,stochastic=TRUE,
         nmin=500,nupdate=500,power=0.6,rate=c(0.3,0.05))
str(fitst)



