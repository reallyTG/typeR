library(ziphsmm)


### Name: fasthmmfit
### Title: Fast gradient descent / stochastic gradient descent algorithm to
###   learn the parameters in a specialized zero-inflated hidden Markov
###   model, where zero-inflation only happens in State 1. And if there
###   were covariates, they could only be the same ones for the
###   state-dependent log Poisson means and the logit structural zero
###   proportion.
### Aliases: fasthmmfit

### ** Examples

#1. no covariates
set.seed(135)
prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
result <- hmmsim(n=10000,M=3,prior=prior_init, tpm_parm=omega,
                emit_parm=emit_init,zeroprop=zero_init)
y <- result$series

time <- proc.time()
fit1 <-  fasthmmfit(y,x=NULL,ntimes=NULL,M=3,prior_init,omega,
              emit_init,0.5, hessian=FALSE,
              method="BFGS", control=list(trace=1))
proc.time() - time


#2. with covariates
priorparm <- 0
tpmparm <- c(-2,2)
zeroindex <- c(1,0)
zeroparm <- c(0,-1,1)
emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
workparm <- c(priorparm,tpmparm,zeroparm,emitparm)

designx <- matrix(rnorm(20000),nrow=10000,ncol=2)
x <- cbind(1,designx) #has to make the additional 1st column of 1 for intercept
result <- hmmsim2(workparm,2,10000,zeroindex,emit_x=designx,zeroinfl_x=designx)
y <- result$series

time <- proc.time()
fit2 <-  fasthmmfit(y=y,x=x,ntimes=NULL,M=2,prior_init=c(0.5,0.5),
              tpm_init=matrix(c(0.9,0.1,0.1,0.9),2,2),
              zero_init=0.4,emit_init=c(7,21), hessian=FALSE,
              method="BFGS", control=list(trace=1))
proc.time() - time
fit2

#3. stochastic gradient descent without covariates
#no covariates
prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
result <- hmmsim(n=50000,M=3,prior=prior_init, tpm_parm=omega,
                emit_parm=emit_init,zeroprop=zero_init)
y <- result$series

initparm2 <- c(-1,-0.5,  -0.3,-0.3,-0.4,-0.4,0.5,0.5,  0,2,3,4)
time <- proc.time()
fitst <- fasthmmfit(y=y,x=NULL,ntimes=NULL,M=3,prior_init=c(0.4,0.3,0.3),
              tpm_init=matrix(c(0.6,0.3,0.1,0.3,0.4,0.3,0.1,0.3,0.6),3,3,byrow=TRUE),
              zero_init=0.3,emit_init=c(8,35,67),stochastic=TRUE,
              nmin=1000,nupdate=1000,power=0.6,rate=c(1,0.05))
proc.time() - time
str(fitst)

#with covariates
priorparm <- 0
tpmparm <- c(-2,2)
zeroindex <- c(1,0)
zeroparm <- c(0,-1,1)
emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
workparm <- c(priorparm,tpmparm,zeroparm,emitparm)

designx <- matrix(rnorm(100000),nrow=50000,ncol=2)
x <- cbind(1,designx) #has to make the additional 1st column of 1 for intercept
result <- hmmsim2(workparm,2,50000,zeroindex,emit_x=designx,zeroinfl_x=designx)
y <- result$series

initparm <- c(0, -1.8,1.8, 0,-0.8,0.8, 1.8,0.6,-0.6,3.1,0.4,-0.3)

time <- proc.time()
fitst <- fasthmmfit(y=y,x=x,ntimes=NULL,M=2,prior_init=c(0.4,0.6),
              tpm_init=matrix(c(0.8,0.2,0.2,0.8),2,2,byrow=TRUE),
              zero_init=0.3,emit_init=c(10,25),stochastic=TRUE,
              nmin=1000,nupdate=1000,power=0.6,rate=c(1,0.05))
proc.time() - time
str(fitst)



