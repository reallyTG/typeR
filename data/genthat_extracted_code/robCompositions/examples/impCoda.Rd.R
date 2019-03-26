library(robCompositions)


### Name: impCoda
### Title: Imputation of missing values in compositional data
### Aliases: impCoda
### Keywords: iteration multivariate robust

### ** Examples


data(expenditures)
x <- expenditures
x[1,3]
x[1,3] <- NA
xi <- impCoda(x)$xImp
xi[1,3]
s1 <- sum(x[1,-3])
impS <- sum(xi[1,-3])
xi[,3] * s1/impS




