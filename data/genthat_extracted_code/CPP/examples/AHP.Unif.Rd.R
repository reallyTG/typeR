library(CPP)


### Name: AHP.Unif
### Title: Probabilistic AHP using Uniform distributions
### Aliases: AHP.Unif

### ** Examples

n=5000 # Simulation
# Expert pair-wise evaluations
Exp.1 = matrix(c(1,0.2,0.3,5,1,0.2,3,5,1),3,3)
Exp.2 = matrix(c(1,2,8,0.5,1,6,0.12,0.16,1),3,3)
Exp.3 = matrix(c(1,0.5,0.5,2,1,6,2,0.16,1),3,3)
Exp.4 = matrix(c(1,3,4,0.3,1,0.5,0.25,0.3,1),3,3)
Exp.5 = matrix(c(1,4,5,0.25,1,1,0.2,1,1),3,3)
list = list(Exp.1,Exp.2,Exp.3,Exp.4,Exp.5)
AHP.Unif(n,list)



