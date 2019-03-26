library(dosresmeta)


### Name: covar.logrr
### Title: Computes the covariance matrix for a set of log relative risks
### Aliases: covar.logrr

### ** Examples

## Loading data
data("alcohol_cvd")

## Obtaining the (co)variance matrix of log RR for the first study (id = 1)
covar.logrr(y = logrr, v = I(se^2), cases = cases, n = n, type = type, 
            data = subset(alcohol_cvd, id == 1))

## Obtaining the (co)variance matrices of log RRfor all study
by(alcohol_cvd, alcohol_cvd$id, function(x)
   covar.logrr(y = logrr, v = I(se^2), cases = cases, n = n, 
               type = type, data = x))

## Restructuring the previous results in a list of matrices
do.call("list", by(alcohol_cvd, alcohol_cvd$id, function(x)
   covar.logrr(y = logrr, v = I(se^2), cases = cases, n = n, type = type,
               data = x)))




