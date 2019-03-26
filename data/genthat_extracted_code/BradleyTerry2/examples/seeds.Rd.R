library(BradleyTerry2)


### Name: seeds
### Title: Seed Germination Data from Crowder (1978)
### Aliases: seeds
### Keywords: datasets

### ** Examples


summary(glmmPQL(cbind(r, n - r) ~ seed + extract,
                random = diag(nrow(seeds)),
                family = binomial, 
                data = seeds))




