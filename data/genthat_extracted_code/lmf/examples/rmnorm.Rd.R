library(lmf)


### Name: rmnorm
### Title: Generate random numbers from the multivariate normal
###   distribution
### Aliases: rmnorm

### ** Examples

#Variance-covariance matrix
varcov <- matrix(c(2.047737e-03, 3.540039e-05, 0.0075178920, 3.540039e-05,
6.122832e-07, 0.0001299661, 7.517892e-03, 1.299661e-04, 0.0276005740), ncol = 3)
#Set names
nam <- c("a", "b", "c")
dimnames(varcov) <- list(nam, nam)
#Check positive definiteness (all positive eigenvalues = positive definite)
eigen(varcov) $values
#Mean
mean <- c(1, 0.3, 0.5)
#Generate n = 1 random vector
rmnorm(n = 1, mean = mean, varcov = varcov)
#Generate n = 10 random vectors
rmnorm(n = 10, mean = mean, varcov = varcov)
#Generate n = 1 random vectors when varcov is non-positive definite
#Non-positive definite varcov matrix
varcov2 <- matrix(c(2.04e-03, 3.54e-05, 7.52e-03, 3.54e-05, 6.15e-07,
  1.30e-04, 7.52e-03, 1.30e-04, 2.76e-02), ncol = 3)
  dimnames(varcov2) <- dimnames(varcov)
eigen(varcov2)
#Random vector
rmnorm(n = 1, mean = mean, varcov = varcov2)



