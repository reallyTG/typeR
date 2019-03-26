library(TPD)


### Name: plotTPD
### Title: Plotting Trait Probability Distributions
### Aliases: plotTPD

### ** Examples

# 1.  Compute the TPDs of five different species. SP3 is in the center of
#   the trait space, and the rest of species in the corners
set.seed(1)
nind <- 10
species_ex <- c(rep("SP1",nind), rep("SP2",nind), rep("SP3",nind),
 rep("SP4",nind), rep("SP5",nind))
traits_ex <- data.frame(trait1 = c(rnorm(nind, 10, 3),
                                   rnorm(nind, 10, 3),
                                   rnorm(nind, 15, 3),
                                   rnorm(nind, 20, 3),
                                   rnorm(nind, 20, 3)),
                        trait2 = c(rnorm(nind, 10, 3),
                                   rnorm(nind, 20, 3),
                                   rnorm(nind, 15, 3),
                                   rnorm(nind, 10, 3),
                                   rnorm(nind, 20, 3)))
## Not run: 
##D species_TPDs_2D <- TPDs (species = species_ex, traits = traits_ex)
##D # Plot all species
##D plotTPD(species_TPDs_2D)
##D # Plot only species 3
##D plotTPD(species_TPDs_2D, whichPlot = 3)
## End(Not run)
#1 dimension case:
species_TPDs_1D <- TPDs (species = species_ex, traits = traits_ex$trait1)
plotTPD(species_TPDs_1D)

#Now, let us plot communities (TPDc)
#2. three different communities with different abundances of each species
abundances_ex <- matrix(c(c(0.05, 0.05, 0.8,  0.05, 0.05),
                          c(0.9,  0,    0,    0,    0.1 ),
                          c(0,    0,    1,    0,    0   )),
                   ncol = 5, byrow = TRUE, dimnames = list(paste0("Comm.",1:3),
                     unique(species_ex)))
## Not run: 
##D example_TPDc_2D <- TPDc (TPDs = species_TPDs_2D, sampUnit = abundances_ex)
##D plotTPD(example_TPDc_2D)
## End(Not run)
example_TPDc_1D <- TPDc (TPDs = species_TPDs_1D, sampUnit = abundances_ex)
plotTPD(example_TPDc_1D)




