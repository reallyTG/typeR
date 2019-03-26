library(mctest)


### Name: mctest
### Title: Multicollinearity diagnostic measures
### Aliases: mctest
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Hald Cement data
data(Hald)
x<-Hald[,-1]
y<-Hald[,1]

## Overall diagnostic measures and eigenvalues with intercept term
mctest(x, y)

## Overall diagnostic measures and eigenvalues without intercept term
mctest(x, y, Inter=FALSE)

## all individual diagnostic measures
mctest(x, y, type="i")

## certain individual diagnostic measures with collinearity detection indication
VIF<-mctest(x, y, type="i", method="VIF")
VIF[[1]][,1] # named VIF values only

## all individual diagnostic measures with correlation matrix
mctest(x, y, type="i", corr=TRUE)

## VIF and correlation matrix with collinearity detection indication
mctest(x, y, type="i", method="VIF", corr=TRUE)

## both overall and individual collinearity diagnostics
mctest(x, y, type="b")
mctest(x, y, type="b", method="VIF", cor=TRUE)

## all overall and vif with correlation matrix
## VIF and CN desired threshold
## eigenvalues without intercept term
mctest(x, y, type="b", method="VIF", Inter=FALSE, vif=15, cn=35)

## Individual collinearity diagnostic measures in matrix of 0 or 1
mctest(x, y, all = TRUE)
mctest(x, y, method = "VIF", all = TRUE)
mctest(x, y, type="b", all = TRUE)




