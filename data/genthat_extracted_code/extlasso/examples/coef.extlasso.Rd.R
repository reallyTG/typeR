library(extlasso)


### Name: coef.extlasso
### Title: Extract coefficients from a fitted extlasso object
### Aliases: coef.extlasso

### ** Examples

x=matrix(rnorm(100*30),100,30)
y=sample(c(0,1),100,replace=TRUE)
g1=extlasso(x,y,family="binomial")
coef(g1)
x=matrix(rnorm(100*30),100,30)
y=rnorm(100)
g1=extlasso(x,y,family="normal")
coef(g1)



