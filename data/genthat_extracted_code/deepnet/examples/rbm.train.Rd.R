library(deepnet)


### Name: rbm.train
### Title: Training a RBM(restricted Boltzmann Machine)
### Aliases: rbm.train

### ** Examples

Var1 <- c(rep(1, 50), rep(0, 50))
Var2 <- c(rep(0, 50), rep(1, 50))
x3 <- matrix(c(Var1, Var2), nrow = 100, ncol = 2)
r1 <- rbm.train(x3, 10, numepochs = 20, cd = 10)



