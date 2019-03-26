library(ptw)


### Name: calc.multicoef
### Title: Calculation of warping coefficients when applying more than one
###   warping function successively
### Aliases: calc.multicoef
### Keywords: manip

### ** Examples

data(gaschrom)
ref <- gaschrom[1,]
samp <- gaschrom[16,]
coef1 <- c(100,1.1, 1e-5)
coef2 <- c(25, 0.95, 3.2e-5)
gaschrom.ptw <- ptw(ref, samp, init.coef = coef1, try = TRUE)
ref.w <- gaschrom.ptw$reference
samp.w <- gaschrom.ptw$warped.sample
samp.w[is.na(samp.w)] <- 0
gaschrom.ptw2 <- ptw(ref.w, samp.w, init.coef = coef2, try = TRUE)
plot(c(gaschrom.ptw2$warped.sample), type = "l")

corr.coef <- calc.multicoef(coef1, coef2)
gaschrom.ptw3 <- ptw(ref, samp, init.coef = corr.coef, try = TRUE)
lines(c(gaschrom.ptw3$warped.sample), col = 2, lty = 2)



