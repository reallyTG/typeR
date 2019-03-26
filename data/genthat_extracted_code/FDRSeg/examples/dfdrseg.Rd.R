library(FDRSeg)


### Name: dfdrseg
### Title: Piecewise constant regression with D-FDRSeg
### Aliases: dfdrseg
### Keywords: nonparametric

### ** Examples

library(stepR)

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
library(stepR)
convKern <- dfilter("bessel", list(pole=4, cutoff=cutoff/sampling))$kern
uh       <- dfdrseg(Y, convKern = convKern, r = 10) # r could be much larger

# plot results
plot(x, Y, pch = 20, col = "grey", xlab="", ylab = "", main = "Simulate Ion Channel Data")
lines(sim$discr, col = "blue")
lines(x, evalStepFun(uh), col = "red")
legend("topleft", c("Truth", "D-FDRSeg"), lty = c(1, 1), col = c("blue", "red"))

## Not run: 
##D # alternatively simulate quantiles first
##D alpha <- 0.1
##D q     <- simulQuantile(1 - alpha, ts*sampling, type = "dfdrseg", convKern = convKern)
##D 
##D # then compute the estimate
##D uh <- dfdrseg(Y, q, convKern = convKern)
## End(Not run)



