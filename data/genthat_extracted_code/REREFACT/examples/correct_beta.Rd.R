library(REREFACT)


### Name: correct_beta
### Title: Re-orders and/or re-signs as needed within the estimated eta on
###   eta regression coefficient matrix for each replication
### Aliases: correct_beta
### Keywords: Permutation matrices Simulation Exploratory Factor Analysis
###   (EFA) Exploratory Structural Equation Modeling (ESEM)

### ** Examples

# Load the P for Example 2 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(P_esem)

# Load 200 replications of the estimated eta on eta regression 
# coefficient matrix provided by replication  numbers 1 through 
# 100 and  4701 through 4800 in Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(sample_beta_esem)

# Specify the following arguments within the correct_beta function for Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

correct_beta(P_data=P_esem, rep=200, n.eta=4, sample_beta=sample_beta_esem)




