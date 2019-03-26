library(RPANDA)


### Name: likelihood_coal_cst
### Title: Likelihood of a phylogeny under the equilibrium diversity model
### Aliases: likelihood_coal_cst

### ** Examples

data(Cetacea)
Vtimes <- sort(branching.times(Cetacea))
tau0 <- 0.1
gamma <- 0.001
ntips <- Ntip(Cetacea)
N0 <- 89
likelihood <- likelihood_coal_cst(Vtimes,ntips,tau0,gamma,N0)



