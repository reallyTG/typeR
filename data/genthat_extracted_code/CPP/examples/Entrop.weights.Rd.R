library(CPP)


### Name: Entrop.weights
### Title: Weights by entropy
### Aliases: Entrop.weights

### ** Examples

Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
Alt.6 = c(6,29,79,-9)
Alt.7 = c(8,37,55,-15)
Alt.8 = c(10,21,69,-11)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5,Alt.6,Alt.7,Alt.8) # Decision matrix.
Entrop.weights(x)



