library(immer)


### Name: immer_latent_regression
### Title: Unidimensional Latent Regression
### Aliases: immer_latent_regression summary.immer_latent_regression
###   coef.immer_latent_regression vcov.immer_latent_regression
###   logLik.immer_latent_regression anova.immer_latent_regression

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Latent regression for Rasch model with simulated data
##D #############################################################################
##D 
##D library(sirt)
##D 
##D #-- simulate data
##D set.seed(9877)
##D I <- 15  # number of items
##D N <- 700 # number of persons per group
##D G <- 3   # number of groups
##D b <- seq(-2,2,len=I)
##D group <- rep( 1:G, each=N)
##D mu <- seq(0,1, length=G)
##D sigma <- seq(1, 1.5, length=G)
##D dat <- sirt::sim.raschtype( stats::rnorm( N*G, mean=mu[group], sd=sigma[group] ), b)
##D 
##D #-- estimate Rasch model with JML
##D mod1 <- immer::immer_jml( dat )
##D summary(mod1)
##D 
##D #-- compute individual likelihood
##D like1 <- IRT.likelihood(mod1)
##D 
##D #-- estimate latent regression
##D mod2 <- immer::immer_latent_regression( like=like1, group=group)
##D summary(mod2)
## End(Not run)



