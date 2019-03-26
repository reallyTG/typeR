library(mvdalab)


### Name: loadings.boots
### Title: BCa Summaries for the loadings of an mvdareg object
### Aliases: loadings.boots

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
loadings.boots(mod1, ncomp = 2, conf = .95)



