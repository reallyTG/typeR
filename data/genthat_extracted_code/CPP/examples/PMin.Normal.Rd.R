library(CPP)


### Name: PMin.Normal
### Title: Probabilities of minimization, by Normal distributions
### Aliases: PMin.Normal

### ** Examples

# Decision matrix
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5)
PMin.Normal(x)



