library(dcemriS4)


### Name: R10.lm
### Title: Estimate Intrinsic Tissue Relaxivity
### Aliases: CA.fast CA.fast,array-method CA.fast2 CA.fast2,array-method
###   E10.lm R1.fast R1.fast,array-method R1.lm R10.lm
### Keywords: misc

### ** Examples

## Parameters for simulated data
S0 <- 100
TR <- 5 / 1000            # seconds
T1 <- 1.5                 # seconds
alpha <- seq(2, 24, by=2) # degrees

## Signal intensities for spoiled gradient echo image
gre <- function(S0, TR, T1, alpha) {
  theta <- alpha * pi/180 # radians
  S0 * (1 - exp(-TR/T1)) * sin(theta) / (1 - cos(theta) * exp(-TR/T1))
}
set.seed(1234)
signal <- array(gre(S0, TR, T1, alpha) + rnorm(length(alpha), sd=.15),
                c(rep(1,3), length(alpha)))
out <- R1.fast(signal, array(TRUE, rep(1,3)), alpha, TR)
unlist(out)
plot(alpha, signal, xlab="Flip angle", ylab="Signal intensity")
lines(alpha, gre(S0, TR, T1, alpha), lwd=2, col=1)
lines(alpha, gre(c(out$M0), TR, 1/c(out$R10), alpha), lwd=2, col=2)
legend("topright", c("True","Estimated"), lwd=2, col=1:2)



