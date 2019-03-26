library(MRFcov)


### Name: predict_MRFnetworks
### Title: Extract predicted network metrics for observations in a given
###   dataset using equations from a fitted 'MRFcov' object
### Aliases: predict_MRFnetworks

### ** Examples

data("Bird.parasites")
CRFmod <- MRFcov(data = Bird.parasites, n_nodes = 4,
                family = "binomial")
predict_MRFnetworks(data = Bird.parasites[1:200, ],
                   MRF_mod = CRFmod, metric = "degree",
                   cutoff = 0.25)





