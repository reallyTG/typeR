library(idefix)


### Name: ImpsampMNL
### Title: Importance sampling MNL
### Aliases: ImpsampMNL

### ** Examples

## Example 1: sample from posterior, no constraints, no alternative specific constants 
# choice design  
design <- example_design
# Respons.
truePar <- c(0.7, 0.6, 0.5, -0.5, -0.7, 1.7) # some values
set.seed(123)
resp <- RespondMNL(par = truePar, des = design, n.alts = 2)
#prior
pm <- c(1, 1, 1, -1, -1, 1) # mean vector 
pc <- diag(1, ncol(design)) # covariance matrix 
# draws from posterior.
ImpsampMNL(n.draws = 100, prior.mean =  pm, prior.covar = pc,
           des = design, n.alts = 2, y = resp)

## example 2:  sample from posterior with constraints 
# and alternative specific constants
# choice design. 
design <- example_design2
# Respons.
truePar <- c(0.2, 0.8, 0.7, 0.6, 0.5, -0.5, -0.7, 1.7) # some values
set.seed(123)
resp <- RespondMNL(par = truePar, des = design, n.alts = 3)
# prior
pm <- c(1, 1, 1, 1, 1, -1, -1, 1) # mean vector 
pc <- diag(1, ncol(design)) # covariance matrix
low = c(-Inf, -Inf, 0, 0, 0, -Inf, -Inf, 0)
up = c(Inf, Inf, Inf, Inf, Inf, 0, 0, Inf)
# draws from posterior.
ImpsampMNL(n.draws = 100, prior.mean =  pm, prior.covar = pc, des = design,
           n.alts = 3, y = resp, lower = low, upper = up, alt.cte = c(1, 1, 0))



