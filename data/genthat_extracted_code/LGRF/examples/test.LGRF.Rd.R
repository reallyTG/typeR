library(LGRF)


### Name: test.LGRF
### Title: Test the association between an outcome variable and a
###   region/gene by LGRF
### Aliases: test.LGRF
### Keywords: test

### ** Examples

## null.LGRF fits the null model. 
# Input: Y, time, X (covariates)
## test.LGRF tests a region and give p-value. 
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
result.null<-null.LGRF(Y,time,X=cbind(X,time[,2]))

# *Please note that the second column of time should be included as a covairate if
# the gene by time interaction effect will be incorperated.  

# The LGRF-G test
pLGRF_G<-test.LGRF(Z,result.null)

# The LGRF-GT test
pLGRF_GT<-test.LGRF(Z,result.null,interGXT=TRUE)

# The LGRF-G test using the IBS similarity
pLGRF_G_IBS<-test.LGRF(Z,result.null,similarity="IBS")

# The LGRF-GT test, main effect is modeled using the IBS similarity
pLGRF_GT_IBS<-test.LGRF(Z,result.null,interGXT=TRUE,similarity="IBS")



