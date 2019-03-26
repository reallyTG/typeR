library(nopaco)


### Name: concordance.test
### Title: Perform a nonparametric concordance test.
### Aliases: concordance.test nopaco

### ** Examples

require(MASS) ##to use mvrnorm function

#Generate a matrix without concordance
matRandom <- matrix(rnorm(3*20),20,3)
concordance.test(matRandom) 

#Generate a matrix with strong concordance
sigma<-matrix(0.8,3,3)
diag(sigma)<-1
matConcordant <- mvrnorm(20,mu=rep(0,3),Sigma=sigma)
concordance.test(matConcordant)

#Test concordances between matrices
aTest <- concordance.test(matConcordant, matRandom)

getPsi(aTest)
coef(aTest)




