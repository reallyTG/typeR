library(locfit)


### Name: sjpi
### Title: Sheather-Jones Plug-in bandwidth criterion.
### Aliases: sjpi
### Keywords: htest

### ** Examples

# Fig 10.2 (S-J parts) from Loader (1999).
data(geyser, package="locfit")
gf <- 2.5
a <- seq(0.05, 0.7, length=100)
z <- sjpi(geyser, a)

# the plug-in curve. Multiplying by gf=2.5 corresponds to Locfit's standard
# scaling for the Gaussian kernel.
plot(gf*z[, 2], gf*z[, 1], type = "l", xlab = "Pilot Bandwidth k", ylab
     = "Bandwidth h")

# Add the assumed curve.
lines(gf * z[, 3], gf * z[, 1], lty = 2)
legend(gf*0.05, gf*0.4, lty = 1:2, legend = c("Plug-in", "SJ assumed"))



