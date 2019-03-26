library(tcpl)


### Name: tcplAICProb
### Title: Calculate the AIC probabilities
### Aliases: tcplAICProb

### ** Examples

## Returns the probability for each model, given models with AIC values 
## ranging from 80 to 100
tcplAICProb(80, 85, 90, 95, 100)

## Also works for vectors
m1 <- c(95, 195, 300) ## model 1 for three different observations
m2 <- c(100, 200, 295) ## model 2 for three different observations
tcplAICProb(m1, m2)




