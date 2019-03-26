library(BayesTree)


### Name: makeind
### Title: Build x matrix from x data frame (convert factors to dummies)
### Aliases: makeind
### Keywords: nonparametric tree regression nonlinear

### ** Examples

x1 = 1:10
x2 = as.factor(c(rep(1,5),rep(2,5)))
x3 = as.factor(c(1,1,1,2,2,2,4,4,4,4))
levels(x3) = c('rob','hugh','ed')
x = data.frame(x1,x2,x3)

junk = makeind(x)



