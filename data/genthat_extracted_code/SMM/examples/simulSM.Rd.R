library(SMM)


### Name: simulSM
### Title: Simulation of a semi-Markov chain
### Aliases: simulSM
### Keywords: Simulation Semi-Markov models

### ** Examples

alphabet = c("a","c","g","t")
S = length(alphabet)
## creation of the initial distribution
vect.init = c(1/4,1/4,1/4,1/4)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), nrow = S, 
ncol = S, byrow = TRUE)

################################
## Parametric simulation of a trajectory (of length equal to 50), 
## where the sojourn times depend neither on the present state nor on the next state ("f").
################################
## Simulation of a sequence of length 50
seq50 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 50, TypeSojournTime = "f", 
                init = vect.init, Ptrans = Pij, distr = "pois", param = 2)
          
## No test: 
      
################################
## Parametric simulation of several trajectories (3 trajectories of length 1000, 
## 10 000 and  2000 respectively),
## where the sojourn times depend on the present state and on the next state ("fij")
## the sojourn time is modelled by different distributions
################################
lengthSeq3 = c(1000, 10000, 2000)
## creation of the distribution matrix
distr.matrix = matrix(c("dweibull", "pois", "geom", "nbinom", "geom", "nbinom", 
"pois", "dweibull", "pois", "pois", "dweibull", "geom", "pois","geom", "geom", 
"nbinom"), nrow = S, ncol = S, byrow = TRUE)
## creation of an array containing the parameters
param1.matrix = matrix(c(0.6,2,0.4,4,0.7,2,5,0.6,2,3,0.6,0.6,4,0.3,0.4,4), 
nrow = S, ncol = S, byrow = TRUE)
param2.matrix = matrix(c(0.8,0,0,2,0,5,0,0.8,0,0,0.8,0,4,0,0,4), nrow = S, 
ncol = S, byrow = TRUE)
param.array = array(c(param1.matrix, param2.matrix), c(S,S,2))
### Simulation of 3 sequences
seq3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, 
TypeSojournTime = "fij", init = vect.init, Ptrans = Pij, distr = distr.matrix, 
param = param.array, File.out = NULL)
                

################################
## Parametric simulation of several trajectories (3 trajectories of length 1000, 
## 10 000 and  2000 respectively),
## where the sojourn times depend only on the present state ("fi.")
## and the sojourn times are modelled by different distributions.
################################
## creation of the distribution matrix
distr.vect = c("dweibull", "pois", "geom", "nbinom")
## creation of an array containing the parameters
param.matrix = matrix(c(0.6,0.8,4,0,0.7,0,5,2), nrow = S, ncol = 2, byrow = TRUE)
### Simulation of 3 sequences without censoring
#seqFi3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fi", 
#             init = vect.init, Ptrans = Pij, distr = distr.vect, param = param.matrix,
#             File.out = NULL)
### Simulation of 3 sequences with censoring at the beginning
#seqFi3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fi", 
#             init = vect.init, Ptrans = Pij, distr = distr.vect, param = param.matrix, 
#             File.out = NULL, cens.beg = 1, cens.end = 0)
### Simulation of 3 sequences with censoring at the end
#seqFi3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fi", 
#             init = vect.init, Ptrans = Pij, distr = distr.vect, param = param.matrix, 
#             File.out = NULL, cens.beg = 0, cens.end = 1)
### Simulation of 3 sequences with censoring at the beginning and at the end
#seqFi3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fi", 
#             init = vect.init, Ptrans = Pij, distr = distr.vect, param = param.matrix,
#             File.out = NULL, cens.beg = 1, cens.end = 1)
                
################################
## Non-parametric simulation of several trajectories (3 trajectories of length 1000,  
## 10 000 and  2000 respectively),
## where the sojourn times depend on the present state and on the next state ("fij")
################################
## creation of a matrix corresponding to the conditionnal sojourn time distribution
Kmax = 4 
mat1 = matrix(c(0,0.5,0.4,0.6,0.3,0,0.5,0.4,0.7,0.2,0,0.3,0.4,0.6,0.2,0), nrow = S, 
ncol = S, byrow = TRUE)
mat2 = matrix(c(0,0.2,0.3,0.1,0.2,0,0.2,0.3,0.1,0.4,0,0.3,0.2,0.1,0.3,0), nrow = S, 
ncol = S, byrow = TRUE)
mat3 = matrix(c(0,0.1,0.3,0.1,0.3,0,0.1,0.2,0.1,0.2,0,0.3,0.3,0.3,0.4,0), nrow = S, 
ncol = S, byrow = TRUE)
mat4 = matrix(c(0,0.2,0,0.2,0.2,0,0.2,0.1,0.1,0.2,0,0.1,0.1,0,0.1,0), nrow = S, 
ncol = S, byrow = TRUE)
f <- array(c(mat1,mat2,mat3,mat4), c(S,S,Kmax))
### Simulation of 3 sequences
seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fij", 
                init = vect.init, Ptrans = Pij, laws = f, File.out = NULL)


################################
## Non-parametric simulation of several trajectories (3 trajectories of length 1000, 
## 10 000 and  2000 respectively),
## where the sojourn times depend only on he next state ("fj")
################################
## creation of a matrix corresponding to the conditional sojourn time distributions
Kmax = 6
nparam.matrix = matrix(c(0.2,0.1,0.3,0.2,0.2,0,0.4,0.2,0.1,0,0.2,0.1,
 0.5,0.3,0.15,0.05,0,0,0.3,0.2,0.1,0.2,0.2,0), 
                       nrow = S, ncol = Kmax, byrow = TRUE)
### Simulation of 3 sequences without censoring
#seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fj", 
#                init = vect.init, Ptrans = Pij, laws = nparam.matrix, File.out = NULL)
### Simulation of 3 sequences with censoring at the beginnig 
#seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fj", 
#                init = vect.init, Ptrans = Pij, laws = nparam.matrix, File.out = NULL, 
#                cens.beg = 1, cens.end = 0)
### Simulation of 3 sequences with censoring at the end 
#seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fj", 
#                init = vect.init, Ptrans = Pij, laws = nparam.matrix, File.out = NULL, 
#                cens.beg = 0, cens.end = 1)
### Simulation of 3 sequences with censoring at the beginning and at the end 
#seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, TypeSojournTime = "fj", 
#                init = vect.init, Ptrans = Pij, laws = nparam.matrix, File.out = NULL, 
#                cens.beg = 1, cens.end = 1)
## End(No test)



