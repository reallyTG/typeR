library(SMM)


### Name: SMM-package
### Title: SMM : Semi-Markov and Markov Models
### Aliases: SMM-package SMM
### Keywords: Markov models Semi-Markov models Simulation Estimation
###   Censored data

### ** Examples

##--------------------------------------##
#  An example for the simulMk function   #
#  see more examples >help(simulMk)      #
##--------------------------------------##
### Example 1 ###
# Second order model with the finite state space {a,c,g,t}
E <- c("a","c","g","t")
S = length(E)
init.distribution <- c(1/6,1/6,5/12,3/12)
k<-2
p <- matrix(0.25, nrow = S^k, ncol = S)

# We simulate 3 sequences of size 1000, 10000 and 2000 respectively
simulMk(E = E, nbSeq = 3, lengthSeq = c(1000, 10000, 2000), Ptrans = p, 
init = init.distribution, k = k)

##--------------------------------------##
#  An example for the estimMk function   #
#  see more examples >help(estimMk)      #
##--------------------------------------##
### Example 1 ###
# Second order model with the finite state space {a,c,g,t}
E <- c("a","c","g","t")
S = length(E)
init.distribution <- c(1/6,1/6,5/12,3/12)
k<-2
p <- matrix(0.25, nrow = S^k, ncol = S)

## simulation of 3 sequences with the simulMk function
seq3 = simulMk(E = E, nbSeq = 3, lengthSeq = c(1000, 10000, 2000), Ptrans = p, 
init = init.distribution, k = 2)

## estimation of simulated sequences 
res3 = estimMk(seq = seq3, E = E, k = 2)

##--------------------------------------##
#  An example for the simulSM function   #
#  see more examples >help(simulSM)      #
##--------------------------------------##
alphabet = c("a","c","g","t")
S = length(alphabet)
## creation of the initial distribution
vect.init = c(1/4,1/4,1/4,1/4)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), 
nrow = S, ncol = S, byrow = TRUE)

################################
## Parametric simulation of a trajectory (of length equal to 50) 
## where the sojourn times do not depend on the present state and on the next state
################################
## Simulation of a sequence of length 50
seq50 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 50, TypeSojournTime = "f", 
                init = vect.init, Ptrans = Pij, distr = "pois", param = 2)
                
##--------------------------------------##
#  An example for the simulSM function   #
#  see more examples >help(simulSM)      #
##--------------------------------------##
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
## Parametric estimation of a trajectory (of length equal to 5000) 
## where the sojourn times do not depend on the present state and on the next state
################################
## Simulation of a sequence of length 5000
seq5000 = simulSM(E = alphabet, NbSeq = 1, lengthSeq = 5000, TypeSojournTime = "f", 
                init = c(1/4,1/4,1/4,1/4), Ptrans = Pij, distr = "pois", param = 2)
                
                
## Estimation of the simulated sequence                
estSeq5000 = estimSM(seq = seq5000, E = alphabet, TypeSojournTime = "f", 
                   distr = "pois", cens.end = 0, cens.beg = 0)
                   



