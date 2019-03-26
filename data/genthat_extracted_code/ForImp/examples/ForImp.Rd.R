library(ForImp)


### Name: ForImp
### Title: Forward Imputation procedure
### Aliases: ForImp
### Keywords: datagen multivariate

### ** Examples

set.seed(1)
# correlation matrix
sigma<-matrix(c(1,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1,0.5,0.5,0.5,0.5,1),4,4)
# generate a 500*4 matrix from a multivariate normal
matc<-rmvnorm(n=500, mean=rep(0,4), sigma=sigma)
# transform the numerical values into ordinal categories (Likert scale)
# obtaining matrix mato
mato<-transfmatcat(matc,4)
# set the number of desired missing values
nummissing<-100
# create the random missing values, obtaining matrix mat
mat<-missingmat(mato, nummissing, pattern="r")
# use function \code{ForImp} to impute missing values, obtaining matrix mati
mati<-ForImp(mat)
# number of correct imputations
nummissing-sum(mati!=mato)



