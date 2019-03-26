library(Umpire)
###############################################################
# We now verify that the MVN methods work, and check the
# assertions made for the 'covar' and 'correl' methods. This uses
# the "hit" code as well as the "engine" code.

# set the seed to ensure reproducibility
set.seed(556401)
# set a limit on tolerance
tolerance <- 1e-10
# create a random orthogonal 2x2 matrix
a <- runif(1)
b <- sqrt(1-a^2)
X <- matrix(c(a, b, -b, a), 2, 2)
# now choose random positive squared-eigenvalues
Lambda2 <- diag(rev(sort(rexp(2))), 2)
# construct a covariance matrix
Y <- t(X) %*% Lambda2 %*% X
# Use the MVN constructor
marvin <- MVN(c(0,0), Y)
# check the four assertions
print(paste("Tolerance for assertion checking:", tolerance))
print(paste("Covar  assertion 1:",
            all(abs(covar(marvin) - Y) < tolerance)
            ))
mar2 <- alterMean(marvin, normalOffset, delta=3)
print(paste("Covar  assertion 2:",
            all(abs(covar(marvin) - covar(mar2)) < tolerance)
            ))
print(paste("Correl assertion 1:",
            all(abs(diag(correl(marvin)) - 1) < tolerance)
            ))
mar3 <- alterSD(marvin, function(x) 2*x)
print(paste("Correl assertion 2:",
            all(abs(correl(marvin) - correl(mar2)) < tolerance)
            ))
rm(a, b, X, Lambda2, Y, marvin, mar2, mar3)


