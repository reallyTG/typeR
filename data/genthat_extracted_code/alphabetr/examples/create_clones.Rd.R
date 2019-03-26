library(alphabetr)


### Name: create_clones
### Title: Create a synthetic set of clones with a specific underlying
###   clonal structure
### Aliases: create_clones

### ** Examples

 # Creating a population containing 1000 beta chains; 10% of clones with
 # dual-beta TCRs and 30% of clones with dual TCRs; 75% beta shared by one
 # clone, 20% by two clones, 5% by three clones; 80% alpha chains shared by
 # one clone, 15% by two clones, and 5% by three clones

 clones <- create_clones(numb_beta = 1000,
                         dual_alpha = .3,
                         dual_beta  = .06,
                         alpha_sharing = c(0.80, 0.15, 0.05),
                         beta_sharing  = c(0.75, 0.20, 0.05))




