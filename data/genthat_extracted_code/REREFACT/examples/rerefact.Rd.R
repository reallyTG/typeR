library(REREFACT)


### Name: rerefact
### Title: Identifies an appropriate permutation matrix for each
###   replication
### Aliases: rerefact
### Keywords: Permutation matrices Simulation Exploratory Factor Analysis
###   (EFA) Exploratory Structural Equation Modeling (ESEM)

### ** Examples

# Dependent packages

require(Matrix)
require(psych)
require(gdata)
require(combinat)

# Load the population pattern coefficient matrix for Example 1 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(pop_L_efa)

# Load 200 replications of the estimated pattern coefficient matrix provided by 
# replication numbers 1 through 100 and 4701 through 4800
# in Example 1 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016). 

data(sample_lambda_efa)

# Specify the following arguments within the rerefact function for Example 1 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

rerefact(n.factor=3, n.eta=3, n.var=10, pop_lambda=pop_L_efa, sample_lambda=sample_lambda_efa)

# Load the population pattern coefficient matrix for Example 2 from 
# Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(pop_L_esem)

# Load 200 replications of the estimated pattern coefficient matrix provided by 
# replication numbers 1 through 100 and 4701 through 4800
# in Example 2 from Myers, Ahn, Lu, Celimli, and Zopluoglu (2016).

data(sample_lambda_esem)

rerefact(n.factor=3, n.eta=4, n.var=10, pop_lambda=pop_L_esem, sample_lambda=sample_lambda_esem)




