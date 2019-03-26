library(eba)


### Name: simulate.eba
### Title: Simulate Responses from EBA Models
### Aliases: simulate.eba
### Keywords: models

### ** Examples

data(celebrities)                     # absolute choice frequencies
A <- list(c(1,10), c(2,10), c(3,10),
          c(4,11), c(5,11), c(6,11),
          c(7,12), c(8,12), c(9,12))  # the structure of aspects
eba1 <- eba(celebrities, A)           # fit elimination-by-aspects model

## Perform parametric bootstrap
LR.stat <- replicate(200, deviance(eba(simulate(eba1), A)))

hist(LR.stat, col="lightgray", border="white", freq=FALSE, breaks=20,
     xlim=c(0, 60), main="Parametric bootstrap")
curve(dchisq(x, df=eba1$goodness.of.fit["df"]), add=TRUE)
abline(v=deviance(eba1), lty=2)



