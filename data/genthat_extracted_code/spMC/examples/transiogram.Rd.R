library(spMC)


### Name: transiogram
### Title: Empirical Transition Probabilities Estimation for 1-D MC
### Aliases: transiogram
### Keywords: spatial distribution

### ** Examples
## No test: 
data(ACM)

# Estimate empirical transition 
# probabilities by points
transiogram(ACM$MAT3, ACM[, 1:3], c(0, 0, 1), 200, 5)
## End(No test)


