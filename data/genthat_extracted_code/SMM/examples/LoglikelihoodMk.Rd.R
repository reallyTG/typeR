library(SMM)


### Name: LoglikelihoodMk
### Title: Loglikelihood (Markov model)
### Aliases: LoglikelihoodMk
### Keywords: Markov models Loglikelihood

### ** Examples

alphabet = c("a","c","g","t")
S = length(alphabet)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), 
nrow = S, ncol = S, byrow = TRUE)

#Pij
#     [,1] [,2] [,3] [,4]
#[1,]  0.0  0.2  0.3  0.5
#[2,]  0.4  0.0  0.2  0.4
#[3,]  0.1  0.2  0.0  0.7
#[4,]  0.8  0.1  0.1  0.0


## Simulation of two sequences of length 20 and 50 respectively
seq2 = simulMk(E = alphabet, nbSeq = 2, lengthSeq = c(20,50), Ptrans = Pij, 
init = rep(1/4,4), k = 1)
                
####################################
## Computation of the loglikelihood
####################################
LoglikelihoodMk(seq = seq2, E = alphabet, mu = rep(1/4,4), Ptrans = Pij, k = 1)

#$L
#$L[[1]]
#[1] -13.90161
#
#$L[[2]]
#[1] -39.58438




