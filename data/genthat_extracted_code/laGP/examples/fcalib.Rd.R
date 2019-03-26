library(laGP)


### Name: fcalib
### Title: Objective function for performing large scale computer model
###   calibration via optimization
### Aliases: fcalib
### Keywords: nonparametric nonlinear smooth models regression spatial
###   optimize design

### ** Examples

## the example here illustrates how fcalib combines aGP.seq and 
## discrep.est functions, duplicating the example in the discrep.est
## documentation file.  It is comprised of snippets from demo("calib"), 
## which contains code from the Calibration Section of vignette("laGP")

## Here we generate calibration data using a true calibration
## parameter, u, and then evaluate log posterior probabilities; 
## the discrep.est documentation repeats this with by first calling
## aGP.seq and then discrep.est.  The answers should be identical, however
## note that a call first to example("fcalib") and then 
## example("discrep.est") will generate two random data sets, causing
## the results not to match

## begin data-generation code identical to aGP.seq, discrep.est, fcalib
## example sections and demo("calib")

## M: computer model test function used in Goh et al, 2013 (Technometrics)
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

## training inputs
ny <- 50; 
X <- lhs(ny, rect[1:2,])    ## computer model train

## true (but unknown) setting of the calibration parameter
## for the computer model
u <- c(0.2, 0.1)
Zu <- M(X, matrix(u, nrow=1)) 

## field data response, biased and replicated
sd <- 0.5
## Y <- computer output + bias + noise
reps <- 2 ## example from paper uses reps <- 10
Y <- rep(Zu,reps) + rep(bias(X),reps) + rnorm(reps*length(Zu), sd=sd) 
## variations: remove the bias or change 2 to 1 to remove replicates

## computer model design
nz <- 10000
XU <- lhs(nz, rect)
nth <- 1 ## number of threads to use in emulation, demo uses 8

## augment with physical model design points 
## with various u settings
XU2 <- matrix(NA, nrow=10*ny, ncol=4)
for(i in 1:10) {
  I <- ((i-1)*ny+1):(ny*i)
  XU2[I,1:2] <- X
}
XU2[,3:4] <- lhs(10*ny, rect[3:4,])
XU <- rbind(XU, XU2)

## evaluate the computer model
Z <- M(XU[,1:2], XU[,3:4])

## flag indicating if estimating bias/discrepancy or not
bias.est <- TRUE
## two passes of ALC with MLE calculations for aGP.seq
methods <- rep("alcray", 2) ## demo uses rep("alc", 2)

## set up priors
da <- d <- darg(NULL, XU)
g <- garg(list(mle=TRUE), Y) 

## end identical data generation code

## now calculate log posterior for true calibration parameter 
## value (u).  You could repeat this for an estimate value 
## from demo("calib"), for example u.hat <- c(0.8236673, 0.1406989)

fcalib(u, XU, Z, X, Y, da, d, g, beta.prior, methods, M, bias.est, nth)



