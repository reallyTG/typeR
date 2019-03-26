library(RPANDA)


### Name: likelihood_coal_var
### Title: Likelihood of a birth-death model using a coalescent approch
### Aliases: likelihood_coal_var

### ** Examples

data(Cetacea)
Vtimes <- sort(branching.times(Cetacea))
lamb0 <- 0.1
alpha <- 0.001
mu0<-0
beta<-0
ntips <- Ntip(Cetacea)
N0 <- 89
likelihood <- likelihood_coal_var(Vtimes, ntips, lamb0, alpha, mu0, beta, N0)



