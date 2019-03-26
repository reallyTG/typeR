library(CPP)


### Name: CPP.SAW.Entropy
### Title: CPP by weighted sum, with weights computed from Shannon entropy.
### Aliases: CPP.SAW.Entropy

### ** Examples

## Decision matrix.
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
Alt.6 = c(6,29,79,-9)
Alt.7 = c(8,37,55,-15)
Alt.8 = c(10,21,69,-11)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5,Alt.6,Alt.7,Alt.8)
CPP.SAW.Entropy(x)



