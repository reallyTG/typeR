library(eggCounts)


### Name: fecr_stanExtra
### Title: Modelling the reduction of faecal egg count data using custom
###   models
### Aliases: fecr_stanExtra
### Keywords: modelling

### ** Examples

## Not run: 
##D library(eggCountsExtra)
##D data(epgs) ## load sample data
##D 
##D ## apply paired model with outliers 
##D model1 <- fecr_stanExtra(epgs$before, epgs$after, rawCounts=FALSE, 
##D          preCF=10, modelName = "Po")
##D samples <- stan2mcmc(model1$stan.samples)
##D fecr_probs(model1$stan.samples, threshold = 0.99)
##D 
##D ## apply a very simple custom model
##D code <- "data{
##D   int J; // number of animals
##D   int y_before[J]; // after treatment McMaster count
##D   int y_after[J]; // before treatment McMaster count
##D }
##D parameters{
##D   real<lower=0> mu;
##D   real<lower=0,upper=1> delta;
##D }
##D model{
##D   mu ~ gamma(1,0.001);
##D   delta ~ beta(1,1);
##D   y_before ~ poisson(mu);
##D   y_after ~ poisson(mu*delta);
##D }"
##D 
##D dat <- list(J = nrow(epgs), y_before = epgs$before,
##D             y_after = epgs$after)
##D model2 <- fecr_stanExtra(modelCode = code, modelData = dat)
## End(Not run)


