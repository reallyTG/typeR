library(CPP)


### Name: CPP.Malmquist.Beta
### Title: CPP by the Malmquist Index, using Beta PERT distributions
### Aliases: CPP.Malmquist.Beta

### ** Examples

# Alternatives' original scores
Alt.1 = c(2,30,86,-5)
Alt.2 = c(4,26,77,-12)
Alt.3 = c(3,22,93,-4)
Alt.4 = c(6,34,65,-10)
Alt.5 = c(5,31,80,-8)
m1 = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5) # Decision matrix of the previous moment '1'.
Alt.1 = c(3,29,82,-3)
Alt.2 = c(6,28,70,-8)
Alt.3 = c(2,20,99,-8)
Alt.4 = c(5,31,62,-14)
Alt.5 = c(9,27,73,-5)
m2 = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5) # Decision matrix of the following moment '2'.
s = 4 # Shape
CPP.Malmquist.Beta(m1,m2,s)



