library(Rphylopars)


### Name: Rphylopars-package
### Title: Phylogenetic Comparative Tools for Missing Data and
###   Within-Species Variation
### Aliases: Rphylopars-package
### Keywords: Phylogenetic variance-covariance Ancestral state
###   reconstruction Intraspecific variation Within-species variation
###   Measurement error Missing data Phylogenetic imputation package

### ** Examples

# simulate data
sim_data <- simtraits(ntaxa = 15,ntraits = 4,nreps = 3,nmissing = 10)

# estimate parameters under Brownian motion
# pheno_error = TRUE assumes intraspecific variation
# pheno_correlated = FALSE assumes intraspecific variation is not correlated
# phylo_correlated = TRUE assumed traits are correlated

PPE <- phylopars(trait_data = sim_data$trait_data,tree = sim_data$tree,
  pheno_error = TRUE,phylo_correlated = TRUE,pheno_correlated = TRUE)

PPE

PPE$anc_recon # Ancestral state reconstruction and species mean prediction
PPE$anc_var # Prediction variance


###NOT RUN
# estimate parameters under multivariate OU
# PPE_OU <- phylopars(trait_data = sim_data$trait_data,tree = sim_data$tree,
#    model="mvOU",pheno_error = TRUE,phylo_correlated = TRUE,
#    pheno_correlated = TRUE)
#
# PPE




