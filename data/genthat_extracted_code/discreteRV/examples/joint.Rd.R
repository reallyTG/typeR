library(discreteRV)


### Name: joint
### Title: Joint probability mass function of random variables X and Y
### Aliases: joint

### ** Examples

d <- RV(c("A","B","C"), odds = c(3,5,11))
d2 <- joint(d,d)
probs(d2)



