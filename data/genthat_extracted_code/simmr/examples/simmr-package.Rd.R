library(simmr)


### Name: simmr-package
### Title: A Stable Isotope Mixing Model
### Aliases: simmr-package simmr
### Keywords: multivariate

### ** Examples

## Not run: 
##D # A first example with 2 tracers (isotopes), 10 observations, and 4 food sources
##D 
##D # Add in the data
##D mix = matrix(c(-10.13, -10.72, -11.39, -11.18, -10.81, -10.7, -10.54, 
##D -10.48, -9.93, -9.37, 11.59, 11.01, 10.59, 10.97, 11.52, 11.89, 
##D 11.73, 10.89, 11.05, 12.3), ncol=2, nrow=10)
##D colnames(mix) = c('d13C','d15N')
##D s_names=c('Source A','Source B','Source C','Source D')
##D s_means = matrix(c(-14, -15.1, -11.03, -14.44, 3.06, 7.05, 13.72, 5.96), ncol=2, nrow=4)
##D s_sds = matrix(c(0.48, 0.38, 0.48, 0.43, 0.46, 0.39, 0.42, 0.48), ncol=2, nrow=4)
##D c_means = matrix(c(2.63, 1.59, 3.41, 3.04, 3.28, 2.34, 2.14, 2.36), ncol=2, nrow=4)
##D c_sds = matrix(c(0.41, 0.44, 0.34, 0.46, 0.46, 0.48, 0.46, 0.66), ncol=2, nrow=4)
##D conc = matrix(c(0.02, 0.1, 0.12, 0.04, 0.02, 0.1, 0.09, 0.05), ncol=2, nrow=4)
##D 
##D # Load into simmr
##D simmr_in = simmr_load(mixtures=mix,
##D                      source_names=s_names,
##D                      source_means=s_means,
##D                      source_sds=s_sds,
##D                      correction_means=c_means,
##D                      correction_sds=c_sds,
##D                      concentration_means = conc)
##D 
##D # Plot
##D plot(simmr_in)
##D 
##D # MCMC run
##D simmr_out = simmr_mcmc(simmr_in)
##D 
##D # Summary
##D summary(simmr_out)
##D 
##D # Plot
##D plot(simmr_out)
## End(Not run)


