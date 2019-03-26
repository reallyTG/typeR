library(LEGIT)


### Name: r1nes_var_select
### Title: Parallel natural evolutionary variable selection assuming
###   multivariate normal search distribution with a simple covariance
###   matrix parametrization (for IMLEGIT)
### Aliases: r1nes_var_select

### ** Examples

## Not run: 
##D ## Example
##D train = example_3way_3latent(250, 2, seed=777)
##D nes = r1nes_var_select(train$data, latent_var=train$latent_var,
##D formula=y ~ E*G*Z)
## End(Not run)



