library(SMM)


### Name: LoglikelihoodSM
### Title: Loglikelihood (semi-Markov model)
### Aliases: LoglikelihoodSM
### Keywords: Semi-Markov models Loglikelihood

### ** Examples

alphabet = c("a","c","g","t")
S = length(alphabet)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), 
nrow = S, ncol = S, byrow = TRUE)

Pij
#     [,1] [,2] [,3] [,4]
#[1,]  0.0  0.2  0.3  0.5
#[2,]  0.4  0.0  0.2  0.4
#[3,]  0.1  0.2  0.0  0.7
#[4,]  0.8  0.1  0.1  0.0

################################
## Parametric estimation of a trajectory (of length equal to 5000), 
## where the sojourn times depend neither on the present state nor on the next state.
################################
## Simulation of a sequence of length 5000
seq5000 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 5000, TypeSojournTime = "f", 
                init = c(1/4,1/4,1/4,1/4), Ptrans = Pij, distr = "pois", param = 2)
                
#################################
## Computation of the loglikelihood
#################################
LoglikelihoodSM(seq = seq5000, E = alphabet, mu = rep(1/4,4), Ptrans = Pij, 
distr = "pois", param = 2, TypeSojournTime = "f")

#$L
#$L[[1]]
#[1] -1475.348
#
#
#$Kmax
#[1] 10

#------------------------------#
################################
## Non-parametric simulation of several trajectories (3 trajectories of length 1000, 
## 10 000 and 2000 respectively),
## where the sojourn times depend on the present state and on the next state.
################################
## creation of a matrix corresponding to the conditional sojourn time distributions
lengthSeq3 = c(1000, 10000, 2000)
Kmax = 4 
mat1 = matrix(c(0,0.5,0.4,0.6,0.3,0,0.5,0.4,0.7,0.2,0,0.3,0.4,0.6,0.2,0), 
nrow = S, ncol = S, byrow = TRUE)
mat2 = matrix(c(0,0.2,0.3,0.1,0.2,0,0.2,0.3,0.1,0.4,0,0.3,0.2,0.1,0.3,0), 
nrow = S, ncol = S, byrow = TRUE)
mat3 = matrix(c(0,0.1,0.3,0.1,0.3,0,0.1,0.2,0.1,0.2,0,0.3,0.3,0.3,0.4,0), 
nrow = S, ncol = S, byrow = TRUE)
mat4 = matrix(c(0,0.2,0,0.2,0.2,0,0.2,0.1,0.1,0.2,0,0.1,0.1,0,0.1,0), 
nrow = S, ncol = S, byrow = TRUE)
f <- array(c(mat1,mat2,mat3,mat4), c(S,S,Kmax))
### Simulation of 3 sequences
seqNP3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, 
TypeSojournTime = "fij", init = rep(1/4,4), Ptrans = Pij, laws = f, 
File.out = NULL)

#################################
## Computation of the loglikelihood
#################################
LoglikelihoodSM(seq = seqNP3, E = alphabet, mu = rep(1/4,4), Ptrans = Pij, laws = f, 
TypeSojournTime = "fij")

#$L
#$L[[1]]
#[1] -429.35
#
#$L[[2]]
#[1] -4214.521
#
#$L[[3]]
#[1] -818.6451
#
#
#$Kmax
#[1] 4



