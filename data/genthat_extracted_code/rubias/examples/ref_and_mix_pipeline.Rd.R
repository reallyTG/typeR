library(rubias)


### Name: ref_and_mix_pipeline
### Title: Estimate mixing proportions from reference and mixture datasets
### Aliases: ref_and_mix_pipeline
### Keywords: internal

### ** Examples

reference <- small_chinook_ref
mixture <- small_chinook_mix
gen_start_col <- 5

# this function expects things as factors.  This function is old and needs
# to be replaced and deprecated.

reference$repunit <- factor(reference$repunit, levels = unique(reference$repunit))
reference$collection <- factor(reference$collection, levels = unique(reference$collection))
mixture$repunit <- factor(mixture$repunit, levels = unique(mixture$repunit))
mixture$collection <- factor(mixture$collection, levels = unique(mixture$collection))

mcmc <- ref_and_mix_pipeline(reference, mixture, gen_start_col, method = "MCMC")




