library(REREFACT)


### Name: correct_alpha
### Title: Re-orders and/or re-signs as needed within the estimated
###   intercept or mean vector for each replication
### Aliases: correct_alpha
### Keywords: Permutation matrices Simulation Exploratory Factor Analysis
###   (EFA) Exploratory Structural Equation Modeling (ESEM)

### ** Examples

# Load the P for Example 2 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(P_esem)

# Load 200 replications of the estimated intercept or mean vector provided by replication 
# numbers 1 through 100 and 4701 through 4800 in Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(sample_alpha_esem)

# Specify the following arguments within the correct_alpha function for Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

correct_alpha(P_data=P_esem, rep=200, n.eta=4, sample_alpha=sample_alpha_esem)




