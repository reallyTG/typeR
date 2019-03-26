library(BinaryEPPM)


### Name: BBprob
### Title: Calculation of vector of probabilities for the beta binomial
###   distribution.
### Aliases: BBprob
### Keywords: distribution

### ** Examples

twoparameter <- c(0.96477815,0.7561417)
names(twoparameter) <- c('p','theta')
nt <- 37
output <- BBprob(twoparameter,nt)
print(output)



