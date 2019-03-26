library(RBesT)


### Name: decision2S_boundary
### Title: Decision Boundary for 2 Sample Designs
### Aliases: decision2S_boundary decision2S_boundary.betaMix
###   decision2S_boundary.normMix decision2S_boundary.gammaMix

### ** Examples


# see ?decision2S for details of example
priorT <- mixnorm(c(1,   0, 0.001), sigma=88, param="mn")
priorP <- mixnorm(c(1, -49, 20   ), sigma=88, param="mn")
# the success criteria is for delta which are larger than some
# threshold value which is why we set lower.tail=FALSE
successCrit  <- decision2S(c(0.95, 0.5), c(0, 50), FALSE)
# the futility criterion acts in the opposite direction
futilityCrit <- decision2S(c(0.90)     , c(40),    TRUE)

# success criterion boundary
successBoundary <- decision2S_boundary(priorP, priorT, 10, 20, successCrit)

# futility criterion boundary
futilityBoundary <- decision2S_boundary(priorP, priorT, 10, 20, futilityCrit)

curve(successBoundary(x), -25:25 - 49, xlab="y2", ylab="critical y1")
curve(futilityBoundary(x), lty=2, add=TRUE)

# hence, for mean in sample 2 of 10, the critical value for y1 is
y1c <- futilityBoundary(-10)

# around the critical value the decision for futility changes
futilityCrit(postmix(priorP, m=y1c+1E-3, n=10), postmix(priorT, m=-10, n=20))
futilityCrit(postmix(priorP, m=y1c-1E-3, n=10), postmix(priorT, m=-10, n=20))




