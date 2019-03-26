library(lmomco)


### Name: fliplmoms
### Title: Flip L-moments by Flip Attribute in L-moment Vector
### Aliases: fliplmoms
### Keywords: data censoring

### ** Examples

# Create some data with **multiple detection limits**
# This is a left-tail censoring problem, and flipping will be required.
fakedat1 <- rnorm(50, mean=16, sd=5)
fake1.left.censor.indicator <- fakedat1 <  14
fakedat1[fake1.left.censor.indicator]   <- 14

fakedat2 <- rnorm(50, mean=16, sd=5)
fake2.left.censor.indicator <- fakedat2 <  10
fakedat2[fake2.left.censor.indicator]   <- 10

# combine the data sets
fakedat <- c(fakedat1, fakedat2);
fake.left.censor.indicator <- c(fake1.left.censor.indicator,
                                fake2.left.censor.indicator)
ix <- order(fakedat)
fakedat <- fakedat[ix]
fake.left.censor.indicator <- fake.left.censor.indicator[ix]

lmr.usual       <- lmoms(fakedat)
lmr.flipped     <- lmomsRCmark(fakedat, flip=TRUE,
                               rcmark=fake.left.censor.indicator)
lmr.backflipped <- fliplmoms(lmr.flipped); # re-transform
pch <- as.numeric(fake.left.censor.indicator)*15 + 1
F <- nonexceeds()
plot(pp(fakedat), sort(fakedat), pch=pch,
     xlab="NONEXCEEDANCE PROBABILITY", ylab="DATA VALUE")
lines(F, qlmomco(F, parnor(lmr.backflipped)), lwd=2)
lines(F, qlmomco(F, parnor(lmr.usual)), lty=2)
legend(0,20, c("Uncensored", "Left-tail censored"), pch=c(1,16))
# The solid line represented the Normal distribution fit by
# censoring indicator on the multiple left-tail detection limits.
## Not run: 
##D # see example in pwmRC
##D H <- c(3,4,5,6,6,7,8,8,9,9,9,10,10,11,11,11,13,13,13,13,13,
##D        17,19,19,25,29,33,42,42,51.9999,52,52,52)
##D # 51.9999 was really 52, a real (noncensored) data point.
##D flip <- 100
##D F <- flip - H #
##D RCpwm <- pwmRC(H, threshold=52)
##D lmorph(pwm2lmom(vec2pwm(RCpwm$Bbetas))) # OUTPUT1 STARTS HERE
##D 
##D LCpwm <- pwmLC(F, threshold=(flip - 52))
##D LClmr <- pwm2lmom(vec2pwm(LCpwm$Bbetas))
##D LClmr <- lmorph(LClmr)
##D #LClmr$flip <- 100; fliplmoms(LClmr) # would also work
##D fliplmoms(LClmr, flip=flip) # OUTPUT2 STARTS HERE
##D 
##D # The two outputs are the same showing how the flip argument works 
## End(Not run)



