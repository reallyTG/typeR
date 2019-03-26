library(fanc)


### Name: fanc
### Title: fanc (penalized maximum likelihood factor analysis via nonconvex
###   penalties)
### Aliases: fanc print.fanc

### ** Examples

#generate data
set.seed(0)
loadings0 <- matrix(c(rep(0.8,5),rep(0,5),rep(0,5),rep(0.8,5)),10,2)
common.factors0 <- matrix(rnorm(50*2),50,2)
unique.factors0 <- matrix(rnorm(50*10,sd=sqrt(0.36)),50,10)
x <- common.factors0 %*% t(loadings0) + unique.factors0

#fit data
fit <- fanc(x,2)
fit2 <- fanc(x,2,cor.factor=TRUE) #factor correlation is estimated

#print candidates of gamma and rho
print(fit)

#output for fixed tuning parameters
out(fit, rho=0.1, gamma=Inf)

#select a model via model selection criterion
select(fit, criterion="BIC", gamma=Inf)

#plot solution path
#plot(fit)



