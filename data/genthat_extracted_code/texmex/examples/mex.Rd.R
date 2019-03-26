library(texmex)


### Name: ggplot.mex
### Title: Conditional multivariate extreme values modelling
### Aliases: ggplot.mex mex plot.mex print.mex predict.mex
###   summary.predict.mex plot.predict.mex mexAll print.mexList
###   print.summary.mex summary.mex ggplot.predict.mex
### Keywords: models multivariate

### ** Examples


w <- mex(winter, mqu=.7)
w
par(mfcol=c(3, 2))
plot(w)

par(mfcol=c(2,2))
p <- predict(w)
summary(p)
summary(p,probs=c(0.01,0.2,0.5,0.8,0.99))
summary(p,probs=0.5,mth=c(40,50,150,25,50))
p
plot(p)





