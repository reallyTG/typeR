library(mda)


### Name: predict.bruto
### Title: Predict method for BRUTO Objects
### Aliases: predict.bruto
### Keywords: smooth

### ** Examples

data(trees)
fit1 <- bruto(trees[,-3], trees[3])
fitted.terms <- predict(fit1, as.matrix(trees[,-3]), type = "terms")
par(mfrow=c(1,2), pty="s")
for(tt in fitted.terms) plot(tt, type="l")



