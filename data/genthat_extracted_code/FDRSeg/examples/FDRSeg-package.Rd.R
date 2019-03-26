library(FDRSeg)


### Name: FDRSeg-package
### Title: FDR-Control in Multiscale Change-Point Segmentation
### Aliases: FDRSeg-package FDRSeg
### Keywords: package nonparametric

### ** Examples

library(stepR)

## (I) Independent Gaussian Data
# simulate data
n  <- 300   # number of observations
K  <- 20    # number of change-points
u0 <- teethfun(n, K)
set.seed(2)
Y  <- rnorm(n, u0, 0.3)

# plot data
plot(Y, pch = 20, col = "grey", ylab = "")
lines(u0, type = "s")

# estimate standard deviation
sd <- sdrobnorm(Y)

# simulate quantiles
alpha <- 0.1
qs    <- simulQuantile(1 - alpha, n, type = "smuce")   # for SMUCE
qfs   <- simulQuantile(1 - alpha, n, type = "fdrseg")  # for FDRSeg

# compute estimates
us  <- smuce(Y, qs, sd = sd)   # SMUCE
ufs <- fdrseg(Y, qfs, sd = sd) # FDRSeg

# plot results
lines(evalStepFun(us),  type = "s", col = "blue")
lines(evalStepFun(ufs), type = "s", col = "red")
legend("topleft", c("Truth", "SMUCE", "FDRSeg"), lty = c(1, 1, 1), col = c("black", "blue", "red"))

## (II) Dependent Gaussian Data
# simulate data (a continuous time Markov chain)
ts        <- 0.1  # sampling time
SNR       <- 3    # signal-to-noise ratio
sampling  <- 1e4  # sampling rate 10 kHz
over      <- 10   # tenfold oversampling
cutoff    <- 1e3  # 1 kHz 4-pole Bessel-filter, adjusted for oversampling
simdf     <- dfilter("bessel", list(pole=4, cutoff=cutoff/sampling/over))
transRate <- 50
rates     <- rbind(c(0, transRate), c(transRate, 0))
set.seed(123)
sim <- contMC(ts*sampling, c(0,SNR), rates, sampling = sampling, family = "gaussKern",  
              param = list(df=simdf, over=over, sd=1))
Y   <- sim$data$y
x   <- sim$data$x

# D-FDRseg 
convKern <- dfilter("bessel", list(pole=4, cutoff=cutoff/sampling))$kern
alpha    <- 0.1
r        <- 10    # r could be much larger
qdfs     <- simulQuantile(1 - alpha, ts*sampling, r, "dfdrseg", convKern)
udfs     <- dfdrseg(Y, qdfs, convKern = convKern) 

# plot results
plot(x, Y, pch = 20, col = "grey", xlab="", ylab = "", main = "Simulate Ion Channel Data")
lines(sim$discr, col = "blue")
lines(x, evalStepFun(udfs), col = "red")
legend("topleft", c("Truth", "D-FDRSeg"), lty = c(1, 1), col = c("blue", "red"))



