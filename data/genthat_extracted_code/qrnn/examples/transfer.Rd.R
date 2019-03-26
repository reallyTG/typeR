library(qrnn)


### Name: transfer
### Title: Transfer functions and their derivatives
### Aliases: sigmoid sigmoid.prime elu elu.prime softplus softplus.prime
###   linear linear.prime

### ** Examples

x <- seq(-10, 10, length=100)
plot(x, sigmoid(x), type="l", col="black", ylab="")
lines(x, sigmoid.prime(x), lty=2, col="black")
lines(x, elu(x), col="red")
lines(x, elu.prime(x), lty=2, col="red")
lines(x, softplus(x), col="blue")
lines(x, softplus.prime(x), lty=2, col="blue")
lines(x, linear(x), col="green")
lines(x, linear.prime(x), lty=2, col="green")



