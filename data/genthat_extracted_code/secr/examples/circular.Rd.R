library(secr)


### Name: circular
### Title: Circular Probability
### Aliases: circular.r circular.p
### Keywords: models

### ** Examples


## Calhoun and Casby (1958) p 3.
## give p = 0.3940, 0.8645, 0.9888
circular.p(1:3, hazard = FALSE)

## halfnormal, hazard-rate and exponential
circular.r ()
circular.r (detectfn = "HR", detectpar = list(sigma = 1, z = 4))
circular.r (detectfn = "EX")
circular.r (detectfn = "HHN")
circular.r (detectfn = "HHR", detectpar = list(sigma = 1, z = 4))
circular.r (detectfn = "HEX")

plot(seq(0, 5, 0.01), circular.p(r = seq(0, 5, 0.01)),
    type = "l", xlab = "Radius (multiples of sigma)", ylab = "Probability")
lines(seq(0, 5, 0.01), circular.p(r = seq(0, 5, 0.01), detectfn = 2),
    type = "l", col = "red")
lines(seq(0, 5, 0.01), circular.p(r = seq(0, 5, 0.01), detectfn = 1,
    detectpar = list(sigma = 1,z = 4)), type = "l", col = "blue")
abline (h = 0.95, lty = 2)

legend (2.8, 0.3, legend = c("halfnormal","hazard-rate, z = 4", "exponential"),
    col = c("black","blue","red"), lty = rep(1,3))

## in this example, a more interesting comparison would use
## sigma = 0.58 for the exponential curve.




