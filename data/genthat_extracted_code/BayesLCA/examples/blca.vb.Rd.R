library(BayesLCA)


### Name: blca.vb
### Title: Bayesian Latent Class Analysis via a variational Bayes algorithm
### Aliases: blca.vb
### Keywords: variational blca

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))

fit <- blca.vb(x, 2)
print(fit)
summary(fit)
par(mfrow=c(3,2))
plot(fit)
par(mfrow=c(1,1))

data(Alzheimer)
sj <- blca.vb(Alzheimer, 10, delta=1/10)
sj$classprob    ##Empty Groups



