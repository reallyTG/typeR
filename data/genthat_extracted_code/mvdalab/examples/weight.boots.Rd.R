library(mvdalab)


### Name: weight.boots
### Title: BCa Summaries for the weights of an mvdareg object
### Aliases: weight.boots

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
weight.boots(mod1, ncomp = 2, conf = .95)



