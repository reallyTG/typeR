library(BayesLCA)


### Name: blca.boot
### Title: Bayesian Latent Class Analysis via an EM Algorithm and Using
###   Empirical Bootstrapping
### Aliases: blca.boot
### Keywords: bootstrap blca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x <- rlca(1000, rbind(type1,type2), c(0.6,0.4))
fit.boot <- blca.boot(x, 2)
summary(fit.boot)

fit <- blca.em(x, 2, se=FALSE)
fit.boot <- blca.boot(x, 2, fit=fit)
fit.boot
plot(fit.boot, which=1:4)



