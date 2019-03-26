library(pheno2geno)


### Name: transformation
### Title: Basic functions to do transformation / normalization of
###   phenotypes.
### Aliases: transformation
### Keywords: manip

### ** Examples

	data <- matrix(runif(1000),10,100)
  resA <- transformation(data, c("log","logit"))
  resB <- transformation(data, c("reciprocal","probit"))



