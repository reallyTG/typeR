library(dbEmpLikeNorm)


### Name: dbELnorm
### Title: Goodness of Fit Test for Normality Among Multiple Groups
### Aliases: dbELnorm
### Keywords: methods

### ** Examples

x = rnorm(30, 3,1)
y = rnorm(40, 4,1)

Lst = list(x,y)
dbELnorm(Lst)

y = runif(40)
Lst = list(x,y)
dbELnorm(Lst)




