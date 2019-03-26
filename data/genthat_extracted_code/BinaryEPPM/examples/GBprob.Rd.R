library(BinaryEPPM)


### Name: GBprob
### Title: Calculation of vector of probabilities for the generalized
###   binomial distribution.
### Aliases: GBprob
### Keywords: distribution

### ** Examples

twoparameter <- c(0.971242852,0.001465007)
names(twoparameter) <- c('p','b')
nt <- 37
output <- GBprob(twoparameter,nt)
print(output)



