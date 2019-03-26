library(EpiModel)


### Name: init.net
### Title: Initial Conditions for Stochastic Network Models
### Aliases: init.net
### Keywords: parameterization

### ** Examples

# Example of using status.vector and infTime.vector together
n <- 100
status <- sample(c("s", "i"), size = n, replace = TRUE, prob = c(0.8, 0.2))
infTime <- rep(NA, n)
infTime[which(status == "i")] <- -rgeom(sum(status == "i"), prob = 0.01) + 2

init.net(status.vector = status, infTime.vector = infTime)




