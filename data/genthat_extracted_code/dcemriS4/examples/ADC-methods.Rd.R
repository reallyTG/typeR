library(dcemriS4)


### Name: ADC.fast
### Title: Estimate the Apparent Diffusion Coefficient (ADC)
### Aliases: ADC.fast ADC.fast,array-method adc.lm
### Keywords: models

### ** Examples

S0 <- 10
b <- c(0, 50, 400, 800)  # units?
D <- 0.7e-3              # mm^2 / sec (normal white matter)

## Signal intensities based on the (simplified) Bloch-Torry equation
dwi <- function(S0, b, D) {
  S0 * exp(-b*D)
}

set.seed(1234)
signal <- array(dwi(S0, b, D) + rnorm(length(b), sd=0.15),
                c(rep(1,3), length(b)))
ADC <- ADC.fast(signal, b, array(TRUE, rep(1,3)))
unlist(ADC) # text output

par(mfrow=c(1,1)) # graphical output
plot(b, signal, xlab="b-value", ylab="Signal intensity")
lines(seq(0,800,10), dwi(S0, seq(0,800,10), D), lwd=2, col=1)
lines(seq(0,800,10), dwi(c(ADC$S0), seq(0,800,10), c(ADC$D)), lwd=2, col=2)
legend("topright", c("True","Estimated"), lwd=2, col=1:2)



