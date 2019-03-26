library(SMM)


### Name: AIC_SM
### Title: AIC (semi-Markov model)
### Aliases: AIC_SM
### Keywords: AIC Semi-Markov models

### ** Examples

alphabet = c("a","c","g","t")
S = length(alphabet)
## creation of the initial distribution
vect.init = c(1/4,1/4,1/4,1/4)
# creation of the transition matrix
Pij = matrix(c(0,0.2,0.3,0.5,0.4,0,0.2,0.4,0.1,0.2,0,0.7,0.8,0.1,0.1,0), 
nrow = S, ncol = S, byrow = TRUE)

#Pij
#     [,1] [,2] [,3] [,4]
#[1,]  0.0  0.2  0.3  0.5
#[2,]  0.4  0.0  0.2  0.4
#[3,]  0.1  0.2  0.0  0.7
#[4,]  0.8  0.1  0.1  0.0


################################
## Parametric simulation of several trajectories (3 trajectories of length 1000, 10 000 
## and 2000 respectively)
## with sojourn times depending on the present state and on the next state
## the sojourn times are modelled by different distributions
################################
lengthSeq3 = c(1000, 10000, 2000)
## creation of the distribution matrix
distr.matrix = matrix(c("dweibull", "pois", "geom", "nbinom", "geom", "nbinom", 
"pois", "dweibull", "pois", "pois", "dweibull", "geom", "pois","geom", "geom", 
"nbinom"), nrow = S, ncol = S, byrow = TRUE)
## creation of an array containing the parameters
param1.matrix = matrix(c(0.6,2,0.4,4,0.7,2,5,0.6,2,3,0.6,0.6,4,0.3,0.4,4), 
nrow = S, ncol = S, byrow = TRUE)
param2.matrix = matrix(c(0.8,0,0,2,0,5,0,0.8,0,0,0.8,0,4,0,0,4), 
nrow = S, ncol = S, byrow = TRUE)
param.array = array(c(param1.matrix, param2.matrix), c(S,S,2))
### simulation of 3 sequences
seq3 = simulSM(E = alphabet, NbSeq = 3, lengthSeq = lengthSeq3, 
TypeSojournTime = "fij", init = vect.init, Ptrans = Pij, distr = distr.matrix,
 param = param.array, File.out = NULL)
                
#################################
## Computation of AIC
#################################
AIC_SM(seq = seq3, E = alphabet, mu = rep(1/4,4), Ptrans = Pij, distr = distr.matrix, 
      param = param.array, TypeSojournTime = "fij")

#[[1]]
#[1] 1566.418
#
#[[2]]
#[1] 15683.48
#
#[[3]]
#[1] 3146.728



