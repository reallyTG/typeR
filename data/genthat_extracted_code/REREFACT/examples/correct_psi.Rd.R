library(REREFACT)


### Name: correct_psi
### Title: Re-orders and/or re-signs as needed within the estimated
###   covariance matrix for the vector of residuals for eta for each
###   replication
### Aliases: correct_psi
### Keywords: Permutation matrices Simulation Exploratory Factor Analysis
###   (EFA) Exploratory Structural Equation Modeling (ESEM)

### ** Examples

# Load the P for Example 1 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(P_efa)

# Load 200 replications of the estimated covariance matrix 
# for the vector of residuals for eta provided by 
# replication numbers 1 through 100 and 4701 through 4800 in Example 1 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(sample_psi_efa)

# Specify the following arguments within the correct_psi function for Example 1 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

correct_psi(P_data=P_efa, rep=200, n.eta=3, sample_psi=sample_psi_efa)

# Load the P for Example 2 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(P_esem)

# Load 200 replications of the estimated covariance matrix
# for the vector of residuals for eta provided by 
# replication numbers 1 through 100 and 4701 through 4800 in Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(sample_psi_esem)

# Specify the following arguments within the correct_psi function for Example 2 from
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

correct_psi(P_data=P_esem, rep=200,n.eta=4, sample_psi=sample_psi_esem)




