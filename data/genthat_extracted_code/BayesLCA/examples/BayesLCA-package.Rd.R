library(BayesLCA)


### Name: BayesLCA-package
### Title: Bayesian Latent Class Analysis
### Aliases: BayesLCA-package BayesLCA
### Keywords: package

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x <- rlca(1000, rbind(type1, type2), c(0.4,0.6))
fit.em <- blca.em(x, 2)
plot(fit.em, which=1)
print(fit.em)
summary(fit.em)
data(Alzheimer)
fit.vb <- blca(Alzheimer, 2, method="vb")
par(mfrow=c(3,3))
plot(fit.vb, which=3:4)
summary(fit.vb)
par(mfrow=c(1,1))



