library(refund)


### Name: predict.pfr
### Title: Prediction from a fitted pfr model
### Aliases: predict.pfr

### ** Examples

######### Octane data example #########
data(gasoline)
N <- length(gasoline$octane)
wavelengths = 2*450:850
nir = matrix(NA, 60,401)
test <- sample(60,20)
for (i in 1:60) nir[i,] = gasoline$NIR[i, ] # changes class from AsIs to matrix
y <- gasoline$octane
fit <- pfr(y~af(nir,argvals=wavelengths,k=c(6,6), m=list(c(2,2),c(2,2))),
              subset=(1:N)[-test])
preds <- predict(fit,newdata=list(nir=nir[test,]),type='response')
plot(preds,y[test])
abline(a=0,b=1)



