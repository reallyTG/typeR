library(brr)


### Name: inference.brr
### Title: Credibility intervals and estimates
### Aliases: coef.brr confint.brr inference.brr predict.brr print.coef.brr
###   print.confint.brr print.predict.brr

### ** Examples

model <- Brr(x=10, y=10, S=100, T=100)
confint(model)
coef(model)
predict(model)
predict(model, Snew=1000, Tnew=1000)
model <- model(Snew=1000, Tnew=1000)
predict(model)



