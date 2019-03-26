library(BayesLCA)


### Name: rlca
### Title: Randomly Generate Binary Data with Underlying Latent Classes
### Aliases: rlca
### Keywords: blca random

### ** Examples

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))

fit <- blca.em(x, 2)

x2<- rlca(1000, fit=fit)
fit2<- blca.em(x2,2)



