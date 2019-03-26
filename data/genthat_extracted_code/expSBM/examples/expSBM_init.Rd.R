library(expSBM)


### Name: expSBM_init
### Title: expSBM_init
### Aliases: expSBM_init

### ** Examples

set.seed(1)
data(high_school)
K <- 4
lambda_init <- rep(1/K,K)
expSBM_init(high_school$edgelist, K)$Z



