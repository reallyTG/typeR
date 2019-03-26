library(Surrogate)


### Name: Fano.BinBin
### Title: Evaluate the possibility of finding a good surrogate in the
###   setting where both S and T are binary endpoints
### Aliases: Fano.BinBin
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Fano ICA MarginalProbs

### ** Examples

# Conduct the analysis assuming no montonicity
# for the true endpoint, using a range of
# upper bounds for prediction errors 
Fano.BinBin(pi1_ = 0.5951 ,  pi_1 = 0.7745, 
fano_delta=c(0.05, 0.1, 0.2), M=1000)


# Conduct the same analysis now sampling from
# a range of values to allow for uncertainty

Fano.BinBin(pi1_ = runif(n=20,min=0.504,max=0.681), 
pi_1 = runif(n=20,min=0.679,max=0.849), 
fano_delta=c(0.05, 0.1, 0.2), M=10, Seed=2)



