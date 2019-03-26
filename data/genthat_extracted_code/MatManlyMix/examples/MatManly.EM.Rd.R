library(MatManlyMix)


### Name: MatManly.EM
### Title: EM algorithm for matrix clustering
### Aliases: MatManly.EM
### Keywords: EM algorithm

### ** Examples

set.seed(123)

data(crime)


Y <- crime$Y[c(2,7),,] / 1000

p <- dim(Y)[1]
T <- dim(Y)[2]
n <- dim(Y)[3]
K <-  2

#init <- MatManly.init(Y, K = K, la = matrix(0.1, K, p), nu = matrix(0.1, K, T))
#M1 <- MatManly.EM(Y, initial = init, max.iter = 1000)




