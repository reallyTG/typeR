library(SADISA)


### Name: SADISA_loglik
### Title: Computes loglikelihood for requested model
### Aliases: SADISA_loglik
### Keywords: model species-abundance-distribution

### ** Examples

data(datasets);
abund_bci <- datasets$dset1.abunvec[[1]];
data(fitresults);
data.paropt <- fitresults$fit1a.parsopt[[1]];
result <- SADISA_loglik(abund = abund_bci,pars = data.paropt,model = c('pm','dl'));
cat('The difference between result and the value in fitresults.RData is:',
result - fitresults$fit1a.llikopt[[1]]);



