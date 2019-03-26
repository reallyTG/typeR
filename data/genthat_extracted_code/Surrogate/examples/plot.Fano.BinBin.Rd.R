library(Surrogate)


### Name: plot.Fano.BinBin
### Title: Plots the distribution of R^2_{HL} either as a density or as
###   function of pi_{10} in the setting where both S and T are binary
###   endpoints
### Aliases: plot.Fano.BinBin
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Fano ICA MarginalProbs

### ** Examples

# Conduct the analysis assuming no montonicity
# for the true endpoint, using a range of
# upper bounds for prediction errors 
FANO<-Fano.BinBin(pi1_ = 0.5951 ,  pi_1 = 0.7745, 
fano_delta=c(0.05, 0.1, 0.2), M=1000)

plot(FANO, Type="Scatter",color=c(3,4,5),Cex.Position="bottom")



