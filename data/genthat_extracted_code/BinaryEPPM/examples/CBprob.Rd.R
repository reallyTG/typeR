library(BinaryEPPM)


### Name: CBprob
### Title: Calculation of vector of probabilities for the correlated
###   binomial distribution.
### Aliases: CBprob
### Keywords: distribution

### ** Examples

twoparameter <- c(0.971242852,0.001465007)
names(twoparameter) <- c('p','rho')
nt <- 37
output <- CBprob(twoparameter,nt)
print(output)



