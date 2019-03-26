library(RSurveillance)


### Name: sep.binom
### Title: Binomial Population sensitivity
### Aliases: sep.binom
### Keywords: methods

### ** Examples

# examples for sep.binom - checked
sep.binom(n=300, pstar = 0.02, se = 0.92)
tested<- seq(10,100, by=10)
prev<- 0.05
sens<- 0.9
sep.binom(tested, prev, sens)



