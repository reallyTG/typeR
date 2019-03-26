library(MPV)


### Name: p2.7
### Title: Data Set for Problem 2-7
### Aliases: p2.7
### Keywords: datasets

### ** Examples

data(p2.7)
attach(p2.7)
purity.lm <- lm(purity ~ hydro)
summary(purity.lm)
# confidence interval for mean purity at 1% hydrocarbon:
predict(purity.lm,newdata=data.frame(hydro = 1.00),interval="confidence")
detach(p2.7)



