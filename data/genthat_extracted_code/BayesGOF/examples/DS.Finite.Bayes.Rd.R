library(BayesGOF)


### Name: DS.Finite.Bayes
### Title: Conduct Finite Bayes Inference on a DS object
### Aliases: DS.Finite.Bayes plot.DS_FB_obj print.DS_FB_obj
### Keywords: DS Main Functions

### ** Examples

## Not run: 
##D ### Finite Bayes: Rat with theta_71 (y_71 = 4, n_71 = 14)
##D data(rat)
##D rat.start <- gMLE.bb(rat$y, rat$n)$estimate
##D rat.ds <- DS.prior(rat, max.m = 4, rat.start. family = "Binomial")
##D rat.FB <- DS.FiniteBayes(rat.ds, y.0 = 4, n.0 = 14)
##D plot(rat.FB)
## End(Not run)



