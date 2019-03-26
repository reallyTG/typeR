library(cctools)


### Name: dusb
### Title: Uniform scaled beta distribution
### Aliases: dusb rusb

### ** Examples

# plot distribution
sq <- seq(-0.8, 0.8, by = 0.01)
plot(sq, dusb(sq), type = "l")
lines(sq, dusb(sq, theta = 0.25), col = 2)
lines(sq, dusb(sq, theta = 0.25, nu = 10), col = 3)

# simulate from the distribution
x <- rusb(100, theta = 0.3, nu = 0)




