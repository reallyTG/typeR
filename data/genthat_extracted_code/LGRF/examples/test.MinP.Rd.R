library(LGRF)


### Name: test.MinP
### Title: Test the association between an outcome variable and a
###   region/gene by MinP
### Aliases: test.MinP
### Keywords: test

### ** Examples

## null.LGRF fits the null model. 
# Input: Y, time, X (covariates)
## test.MinP tests a region and give p-value. 
# Input: Z (genetic variants) and result of null.longGRF

library(LGRF)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# time: describe longitudinal structure, n by 2 matrix
# Z: genotype matrix, m by q matrix where m is the total number of subjects

data(LGRF.example)
Y<-LGRF.example$Y;time<-LGRF.example$time;X<-LGRF.example$X;Z<-LGRF.example$Z

# Fit the null model
result.null<-null.LGRF(Y,time,X=X)

# The minimum p-value test based on GEE
pMinP<-test.MinP(Z,result.null,corstr="exchangeable",MinP.adjust=0.95)




