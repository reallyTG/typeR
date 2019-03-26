library(CPP)


### Name: PMin.Beta
### Title: Probabilities of minimization, by Beta PERT distributions
### Aliases: PMin.Beta

### ** Examples

# Decision matrix
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5)
s = 4 # Shape
PMin.Beta(x,s)



