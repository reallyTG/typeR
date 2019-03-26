library(mclust)


### Name: predict.MclustDR
### Title: Classify multivariate observations on a dimension reduced
###   subspace by Gaussian finite mixture modeling
### Aliases: predict.MclustDR predict2D.MclustDR
### Keywords: multivariate

### ** Examples

mod = Mclust(iris[,1:4])
dr = MclustDR(mod)
pred = predict(dr)
str(pred)

data(banknote)
mod = MclustDA(banknote[,2:7], banknote$Status)
dr = MclustDR(mod)
pred = predict(dr)
str(pred)



