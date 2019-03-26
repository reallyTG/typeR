library(TPD)


### Name: REND
### Title: Functional Evenness, Richness and Divergence of Communities,
###   Species or Populations
### Aliases: REND

### ** Examples

# 1.  Compute the TPDs of five different species. SP3 is in the center of
#   the trait space, and the rest of species in the corners
set.seed(1)
species_ex <- c(rep("SP1",20), rep("SP2",20), rep("SP3",20), rep("SP4",20),
             rep("SP5",20))
traits_ex <- data.frame(trait1 = c(rnorm(20, 10, 1),
                                   rnorm(20, 10, 1),
                                   rnorm(20, 15, 1),
                                   rnorm(20, 20, 1),
                                   rnorm(20, 20, 1)),
                        trait2 = c(rnorm(20, 10, 1),
                                   rnorm(20, 20, 1),
                                   rnorm(20, 15, 1),
                                   rnorm(20, 10, 1),
                                   rnorm(20, 20, 1)))
species_TPDs <- TPDs (species = species_ex, traits = traits_ex)
#2. Five different communities with different abundances of each species
abundances_ex <- matrix(c(0.05, 0.05, 0.8,  0.05, 0.05, # 1. Low divergence
                   0.9,  0,    0,    0,    0.1,  # 2. High divergence
                   0,    0,    1,    0,    0,    # 3. Low Richness
                   0.2,  0.2,  0.2,  0.2,  0.2,  # 4. High Evenness
                   0.8,  0.05, 0.05, 0.05, 0.05), # 5. Low Evenness
                   ncol = 5, byrow = TRUE, dimnames = list(paste0("Comm.",1:5),
                   unique(species_ex)))

example_TPDc <- TPDc (TPDs = species_TPDs, sampUnit = abundances_ex)
#3. Estimate functional richness, evenness and divergence
example_RicEveDiv <- REND (TPDc = example_TPDc)



