library(brglm)


### Name: separation.detection
### Title: Separation Identification.
### Aliases: separation.detection
### Keywords: models utilities

### ** Examples

## Begin Example
y <- c(1,1,0,0)
totals <- c(2,2,2,2)
x1 <- c(1,0,1,0)
x2 <- c(1,1,0,0)
m1 <- glm(y/totals ~ x1 + x2, weights = totals, family = binomial())
# No warning from glm...
m1
# However estimates for (Intercept) and x2 are unusually large in
# absolute value... Investigate further:
#
separation.detection(m1,nsteps=30)
# Note that the values in the column for (Intercept) and x2 diverge,
# while for x1 converged. Hence, separation has occurred and the
# maximum lieklihood estimate for (Intercept) is minus infinity and
# for x2 is plus infinity. The signs for infinity are taken from the
# signs of (Intercept) and x1 in coef(m1).
## End Example



