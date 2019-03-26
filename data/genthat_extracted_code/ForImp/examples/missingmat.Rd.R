library(ForImp)


### Name: missingmat
### Title: Random generation of missing values
### Aliases: missingmat
### Keywords: datagen multivariate

### ** Examples

set.seed(1)
# correlation matrix
sigma<-matrix(c(1,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1),4,4)
# generate a n*m matrix from a multivariate normal
n<-500
m<-4
matc<-rmvnorm(n, mean=rep(0,m), sigma=sigma)
# transform the numerical values into ordinal categories (Likert scale)
# obtaining matrix mato
mato<-transfmatcat(matc,c(2,3,4,5))
# set the number of desired missing values
nummissing<-150
# create the random missing values
# random missing values
matc<-missingmat(mato, nummissing, pattern= "r")
matc
# random blocks of missing values on variables 1,2 and 3
matc<-missingmat(mato, nummissing, pattern= "b", nk=c(2,3))
matc
# missing values on lowest category of variable 4
matl<-missingmat(mato, nummissing, pattern= "l", nk=4, p=0.1)
matl
# not at random missing values on variable 4
matn<-missingmat(mato, nummissing, pattern= "n", nk=4, w=4)
matn



