library(meboot)


### Name: flexMeboot
### Title: Flexible Extension of the Maximum Entropy Bootstrap Procedure
### Aliases: flexMeboot
### Keywords: ts

### ** Examples

set.seed(235)
myseq <- seq(-1, 1, by = 0.5)
xx <- flexMeboot(x = AirPassengers, myseq = myseq, reps = 3)
matplot(cbind(AirPassengers, xx), type = "l")



