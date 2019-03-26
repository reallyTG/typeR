library(plfm)


### Name: gendat
### Title: Data generation
### Aliases: gendat

### ** Examples

## define constants
J<-20
K<-15
F<-2

## generate true parameters
set.seed(43565)
objectparameters<-matrix(runif(J*F),nrow=J)
attributeparameters<-matrix(runif(K*F),nrow=K)

## compute association probabilities for a conjunctive model
probconj<-gendat(maprule="conj",N=0,
             objpar=objectparameters,attpar=attributeparameters)

## generate data for a disjunctive model using N=200 replications
gdat<-gendat(maprule="disj",N=200,
             objpar=objectparameters,attpar=attributeparameters)

## generate data for a additive model using N=200 replications
gdat<-gendat(maprule="add",N=200,
             objpar=objectparameters,attpar=attributeparameters)



