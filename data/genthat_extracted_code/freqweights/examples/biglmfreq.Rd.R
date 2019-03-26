library(freqweights)


### Name: biglmfreq
### Title: Estimates the coefficients of a linear model
### Aliases: biglmfreq coef.biglmfreq predict.biglmfreq update.biglmfreq
###   coef.biglmfreq predict.biglmfreq print.biglmfreq update.biglmfreq

### ** Examples

mt <- biglmfreq(Sepal.Length ~ Sepal.Width, iris)
coef(mt)

chunk1 <- iris[1:30,]
chunk2 <- iris[-c(1:30),]
mf1 <- biglmfreq(Sepal.Length ~ Sepal.Width, chunk1)
mf2 <- update(mf1, chunk2)

predict(mf2, iris)



