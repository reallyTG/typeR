library(laGP)


### Name: discrep.est
### Title: Estimate Discrepancy in Calibration Model
### Aliases: discrep.est
### Keywords: nonparametric nonlinear smooth models regression spatial
###   optimize design

### ** Examples

## the example here combines aGP.seq and discrep.est functions; 
## it is comprised of snippets from demo("calib"), which contains
## code from the Calibration Section of vignette("laGP")

## Here we generate calibration data using a true calibration
## parameter, u, and then evaluate log posterior probabilities
## and out-of-sample RMSEs for that u value;  the fcalib 
## documentation repeats this with a single call to fcalib rather 
## than first aGP.seq and then discrep.est

## begin data-generation code identical to aGP.seq, discrep.est, fcalib
## example sections and demo("calib")

## M: computer model test functon used in Goh et al, 2013 (Technometrics)
## an elaboration of one from Bastos and O'Hagan, 2009 (Technometrics) 
M <- function(x,u) 
  {
    x <- as.matrix(x)
    u <- as.matrix(u)
    out <- (1-exp(-1/(2*x[,2]))) 
    out <- out * (1000*u[,1]*x[,1]^3+1900*x[,1]^2+2092*x[,1]+60) 
    out <- out / (100*u[,2]*x[,1]^3+500*x[,1]^2+4*x[,1]+20)  
    return(out)
  }
  
## bias: discrepancy function from Goh et al, 2013 
bias <- function(x) 
  {
    x<-as.matrix(x)   
    out<- 2*(10*x[,1]^2+4*x[,2]^2) / (50*x[,1]*x[,2]+10)
    return(out)
  }

## beta.prior: marginal beta prior for u, 
## defaults to a mode at 1/2 in hypercube
beta.prior <- function(u, a=2, b=2, log=TRUE)
{
  if(length(a) == 1) a <- rep(a, length(u))
  else if(length(a) != length(u)) stop("length(a) must be 1 or length(u)")
  if(length(b) == 1) b <- rep(b, length(u))
  else if(length(b) != length(u)) stop("length(b) must be 1 or length(u)")
  if(log) return(sum(dbeta(u, a, b, log=TRUE)))
  else return(prod(dbeta(u, a, b, log=FALSE)))
}

## tgp for LHS sampling
library(tgp)
rect <- matrix(rep(0:1, 4), ncol=2, byrow=2)

## training and testing inputs
ny <- 50; nny <- 1000  
X <- lhs(ny, rect[1:2,])    ## computer model train
XX <- lhs(nny, rect[1:2,],) ## test

## true (but unknown) setting of the calibration parameter
## for the computer model
u <- c(0.2, 0.1)
Zu <- M(X, matrix(u, nrow=1)) 
ZZu <- M(XX, matrix(u, nrow=1)) 

## field data response, biased and replicated
sd <- 0.5
## Y <- computer output + bias + noise
reps <- 2 ## example from paper uses reps <- 10
Y <- rep(Zu,reps) + rep(bias(X),reps) + rnorm(reps*length(Zu), sd=sd) 
YYtrue <- ZZu + bias(XX) 
## variations: remove the bias or change 2 to 1 to remove replicates

## computer model design
nz <- 10000
XT <- lhs(nz, rect)
nth <- 1 ## number of threads to use in emulation, demo uses 8

## augment with physical model design points 
## with various u settings
XT2 <- matrix(NA, nrow=10*ny, ncol=4)
for(i in 1:10) {
  I <- ((i-1)*ny+1):(ny*i)
  XT2[I,1:2] <- X
}
XT2[,3:4] <- lhs(10*ny, rect[3:4,])
XT <- rbind(XT, XT2)

## evaluate the computer model
Z <- M(XT[,1:2], XT[,3:4])

## flag indicating if estimating bias/discrepancy or not
bias.est <- TRUE
## two passes of ALC with MLE calculations for aGP.seq
methods <- rep("alcray", 2) ## demo uses rep("alc", 2)

## set up priors
da <- d <- darg(NULL, XT)
g <- garg(list(mle=TRUE), Y) 

## end identical data generation code

## now calculate log posterior and do out-of-sample RMSE calculation
## for true calibration parameter value (u).  You could repeat
## this for an estimate value from demo("calib"), for example
## u.hat <- c(0.8236673, 0.1406989)

## first log posterior

## emulate at field-data locations Xu
Xu <- cbind(X, matrix(rep(u, ny), ncol=2, byrow=TRUE))
ehat.u <- aGP.seq(XT, Z, Xu, da, methods, ncalib=2, omp.threads=nth, verb=0)

## estimate discrepancy from the residual
cmle.u <- discrep.est(X, Y, ehat.u$mean, d, g, bias.est, FALSE)
cmle.u$ll <- cmle.u$ll + beta.prior(u)
print(cmle.u$ll)
## compare to same calculation with u.hat above

## now RMSE
## Not run: 
##D ## predictive design with true calibration parameter
##D XXu <- cbind(XX, matrix(rep(u, nny), ncol=2, byrow=TRUE))
##D 
##D ## emulate at predictive design
##D ehat.oos.u <- aGP.seq(XT, Z, XXu, da, methods, ncalib=2, 
##D   omp.threads=nth, verb=0)
##D 
##D ## predict via discrepency
##D YYm.pred.u <- predGP(cmle.u$gp, XX)
##D 
##D ## add in emulation
##D YY.pred.u <- YYm.pred.u$mean + ehat.oos.u$mean
##D 
##D ## calculate RMSE
##D rmse.u <- sqrt(mean((YY.pred.u - YYtrue)^2))
##D print(rmse.u)
##D ## compare to same calculation with u.hat above
##D 
##D ## clean up
##D deleteGP(cmle.u$gp)
## End(Not run)



