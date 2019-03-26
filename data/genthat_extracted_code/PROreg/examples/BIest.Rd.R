library(PROreg)


### Name: BIest
### Title: Estimation of the parameters of a binomial distribution with
###   optional dispersion parameter.
### Aliases: BIest

### ** Examples

set.seed(9)
# We simulate the binomial data with some fixed parameters and
# then try to reach the same estimations.
m <- 10   
k <- 100
p <- 0.654
y <- rBI(k,m,p) #Simulations

# without dispersion parameter
BIest(y,m)

# with dispersion parameter
# estimation by method of moments.
BIest(y,m,disp=TRUE,method="MM")
# estimation by maximum quasi-likelihood.
BIest(y,m,disp=TRUE,method="MLE")



