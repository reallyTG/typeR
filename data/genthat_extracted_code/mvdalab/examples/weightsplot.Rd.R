library(mvdalab)


### Name: weightsplot
### Title: Extract Graphical Summary Information Pertaining to the Weights
### Aliases: weightsplot

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
weightsplot(mod1, ncomp = 1:2)



