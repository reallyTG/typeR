library(neuralnet)


### Name: plot.nn
### Title: Plot method for neural networks
### Aliases: plot.nn
### Keywords: neural

### ** Examples


XOR <- c(0,1,1,0)
xor.data <- data.frame(expand.grid(c(0,1), c(0,1)), XOR)
print(net.xor <- neuralnet( XOR~Var1+Var2, xor.data, hidden=2, rep=5))
plot(net.xor, rep="best")




