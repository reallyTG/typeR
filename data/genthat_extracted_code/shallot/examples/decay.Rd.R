library(shallot)


### Name: decay
### Title: Decay
### Aliases: decay decay.reciprocal decay.exponential decay.subtraction
###   print.shallot.decay

### ** Examples

temp <- temperature(1.0)
distance <- dist(scale(USArrests))
decay1 <- decay.reciprocal(temp,distance)
decay2 <- decay.exponential(temp,distance)
decay3 <- decay.subtraction(temp,distance)



