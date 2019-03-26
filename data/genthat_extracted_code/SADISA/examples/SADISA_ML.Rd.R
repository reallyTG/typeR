library(SADISA)


### Name: SADISA_ML
### Title: Performs maximum likelihood parameter estimation for requested
###   model
### Aliases: SADISA_ML
### Keywords: model species-abundance-distribution

### ** Examples

utils::data(datasets);
utils::data(fitresults);
result <- SADISA_ML(
   abund = datasets$dset1.abunvec[[1]],
   initpars = fitresults$fit1a.parsopt[[1]],
   labelpars = c(1,1),
   model = c('pm','dl'),
   tol = c(1E-1, 1E-1, 1E-1)
   );
# Note that tolerances should be set much lower than 1E-1 to get the best results.



