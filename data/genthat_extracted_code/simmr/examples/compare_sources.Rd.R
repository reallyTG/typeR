library(simmr)


### Name: compare_sources
### Title: Compare dietary proportions between multiple sources
### Aliases: compare_sources

### ** Examples
## Not run: 
##D # Data set 1: 10 obs on 2 isos, 4 sources, with tefs and concdep
##D 
##D # The data
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
##D simmr_1 = simmr_load(mixtures=mix,
##D                      source_names=s_names,
##D                      source_means=s_means,
##D                      source_sds=s_sds,
##D                      correction_means=c_means,
##D                      correction_sds=c_sds,
##D                      concentration_means = conc)
##D 
##D # Plot
##D plot(simmr_1)
##D 
##D # Print
##D simmr_1
##D 
##D # MCMC run
##D simmr_1_out = simmr_mcmc(simmr_1)
##D 
##D # Print it
##D print(simmr_1_out)
##D 
##D # Summary
##D summary(simmr_1_out)
##D summary(simmr_1_out,type='diagnostics')
##D summary(simmr_1_out,type='correlations')
##D summary(simmr_1_out,type='statistics')
##D ans = summary(simmr_1_out,type=c('quantiles','statistics'))
##D 
##D # Plot
##D plot(simmr_1_out)
##D plot(simmr_1_out,type='boxplot')
##D plot(simmr_1_out,type='histogram')
##D plot(simmr_1_out,type='density')
##D plot(simmr_1_out,type='matrix')
##D 
##D # Compare two sources
##D compare_sources(simmr_1_out,sources=c('Zostera','U.lactuca'))
##D 
##D # Compare multiple sources
##D compare_sources(simmr_1_out)
## End(Not run)



