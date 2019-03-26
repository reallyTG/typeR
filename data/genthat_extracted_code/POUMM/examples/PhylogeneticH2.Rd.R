library(POUMM)


### Name: PhylogeneticH2
### Title: Phylogenetic Heritability
### Aliases: PhylogeneticH2 alpha sigmaOU sigmae H2e

### ** Examples

# At POUMM stationary state (equilibrium, t=Inf)
H2 <- H2(alpha = 0.75, sigma = 1, sigmae = 1, t = Inf)     # 0.4
alpha <- alpha(H2 = H2, sigma = 1, sigmae = 1, t = Inf)    # 0.75
sigma <- sigmaOU(H2 = H2, alpha = 0.75, sigmae = 1, t = Inf) # 1
sigmae <- sigmae(H2 = H2, alpha = 0.75, sigma = 1, t = Inf) # 1

# At finite time t = 0.2
H2 <- H2(alpha = 0.75, sigma = 1, sigmae = 1, t = 0.2)     # 0.1473309
alpha <- alpha(H2 = H2, sigma = 1, sigmae = 1, t = 0.2)    # 0.75
sigma <- sigmaOU(H2 = H2, alpha = 0.75, sigmae = 1, t = 0.2) # 1
sigmae <- sigmae(H2  =  H2, alpha = 0.75, sigma = 1, t = 0.2) # 1

   



