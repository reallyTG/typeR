library(SynchWave)


### Name: cwt_fw
### Title: Forward Continuous Wavelet Transform
### Aliases: cwt_fw
### Keywords: nonparametric

### ** Examples

tt <- seq(0, 10, , 1024)
f0 <- (1+0.6*cos(2*tt))*cos(4*pi*tt+1.2*tt^2)
sigma <- 0.5
f <- f0 + sigma*rnorm(length(tt))

# Continuous wavelet transform
nv <- 32
opt <- list(type = "bump")
cwtfit <- cwt_fw(f, opt$type, nv, tt[2]-tt[1], opt)



