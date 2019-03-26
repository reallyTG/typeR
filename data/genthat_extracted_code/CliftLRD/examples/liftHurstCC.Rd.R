library(CliftLRD)


### Name: liftHurstCC
### Title: Performs (non-decimated) complex-valued lifting based estimation
###   of the Hurst exponent of a complex-valued time series
### Aliases: liftHurstCC
### Keywords: manip regression ts

### ** Examples


# generate a fake complex-valued series 
x<-complex(real=rnorm(150), imaginary=rnorm(150))

# perform lifting-based estimation of the Hurst exponent

Hestx<-liftHurstCC(x,ntraj=25)




