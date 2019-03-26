library(nnlasso)


### Name: coef.nnlasso
### Title: Extract coefficients from a fitted nnlasso object
### Aliases: coef.nnlasso

### ** Examples

data(car)
attach(car)
x=car[,1:10]
g1=nnlasso(x,y1,family="binomial")
coef(g1)
g1=nnlasso(x,y,family="normal")
coef(g1)
detach(car)



