library(GenOrd)


### Name: ordcont
### Title: Computing the "intermediate" correlation matrix for the
###   multivariate standard normal in order to achieve the "target"
###   correlation matrix for the multivariate discrete variable
### Aliases: ordcont
### Keywords: htest models multivariate distribution datagen

### ** Examples

# consider a 4-dimensional ordinal variable
k <- 4
# with different number of categories
kj <- c(2,3,4,5)
# and uniform marginal distributions
marginal <- list(0.5, (1:2)/3, (1:3)/4, (1:4)/5)
corrcheck(marginal)
# and the following correlation matrix
Sigma <- matrix(c(1,0.5,0.4,0.3,0.5,1,0.5,0.4,0.4,0.5,1,0.5,0.3,0.4,0.5,1),
4, 4, byrow=TRUE)
Sigma
# the correlation matrix of the standard 4-dimensional standard normal
# ensuring Sigma is
res <- ordcont(marginal, Sigma)
res[[1]]
# change some marginal distributions
marginal <- list(0.3, c(1/3, 2/3), c(1/5, 2/5, 3/5), c(0.1, 0.2, 0.4, 0.6))
corrcheck(marginal)
# and notice how the correlation matrix of the multivariate normal changes...
res <- ordcont(marginal, Sigma)
res[[1]]
# change Sigma, adding a negative correlation
Sigma[1,2] <- -0.2
Sigma[2,1] <- Sigma[1,2]
Sigma
# checking whether Sigma is still positive definite
eigen(Sigma)$values # all >0, OK
res <- ordcont(marginal, Sigma)
res[[1]]



