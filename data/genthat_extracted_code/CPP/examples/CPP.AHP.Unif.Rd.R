library(CPP)


### Name: CPP.AHP.Unif
### Title: CPP Additive Weighting with Probabilistic AHP using Uniform
###   distributions
### Aliases: CPP.AHP.Unif

### ** Examples

# Computing weights by the AHP method, with 'n' simulated matrices.
n=5000 # simulation
# Expert pair-wise evaluations
Exp.1 = matrix(c(1,0.2,0.3,5,1,0.2,3,5,1),3,3)
Exp.2 = matrix(c(1,2,8,0.5,1,6,0.12,0.16,1),3,3)
Exp.3 = matrix(c(1,0.5,0.5,2,1,6,2,0.16,1),3,3)
Exp.4 = matrix(c(1,3,4,0.3,1,0.5,0.25,0.3,1),3,3)
Exp.5 = matrix(c(1,4,5,0.25,1,1,0.2,1,1),3,3)
list = list(Exp.1,Exp.2,Exp.3,Exp.4,Exp.5)
# Alternatives' original scores
Alt.1 = c(30,86,-5)
Alt.2 = c(26,77,-12)
Alt.3 = c(22,93,-4)
Alt.4 = c(34,65,-10)
Alt.5 = c(31,80,-8)
Alt.6 = c(29,79,-9)
Alt.7 = c(37,55,-15)
Alt.8 = c(21,69,-11)
x = rbind(Alt.1,Alt.2,Alt.3,Alt.4,Alt.5,Alt.6,Alt.7,Alt.8) # Decision matrix
CPP.AHP.Unif(n,list,x)



