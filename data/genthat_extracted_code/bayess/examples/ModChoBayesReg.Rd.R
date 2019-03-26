library(bayess)


### Name: ModChoBayesReg
### Title: Bayesian model choice procedure for the linear model
### Aliases: ModChoBayesReg
### Keywords: linear regression model choice random walk

### ** Examples

data(caterpillar)
y=log(caterpillar$y)
X=as.matrix(caterpillar[,1:8])
res2=ModChoBayesReg(y,X)



