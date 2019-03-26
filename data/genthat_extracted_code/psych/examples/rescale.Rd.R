library(psych)


### Name: rescale
### Title: Function to convert scores to "conventional " metrics
### Aliases: rescale
### Keywords: multivariate models univar

### ** Examples

T <- rescale(attitude,50,10) #all put on same scale
describe(T)
T1 <- rescale(attitude,seq(0,300,50),seq(10,70,10)) #different means and sigmas
describe(T1)



