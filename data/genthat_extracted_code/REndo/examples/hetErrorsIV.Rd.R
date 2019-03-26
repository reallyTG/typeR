library(REndo)


### Name: hetErrorsIV
### Title: Fitting Linear Models with Endogenous Regressors using
###   Heteroskedastic Covariance Restrictions
### Aliases: hetErrorsIV

### ** Examples

data("dataHetIV")
# P is the endogenous regressor in all examples

# 2 IVs, one from X1, one from X2
het <- hetErrorsIV(y~X1+X2+P|P|IIV(X1)+IIV(X2), data=dataHetIV)
# same as above
het <- hetErrorsIV(y~X1+X2+P|P|IIV(X1,X2), data=dataHetIV)

# use X2 as an external IV
het <- hetErrorsIV(y~X1+P|P|IIV(X1)|X2, data=dataHetIV)

summary(het)




