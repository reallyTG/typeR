library(mvdalab)


### Name: loadingsplot
### Title: Graphical Summary Information Pertaining to the Loadings
### Aliases: loadingsplot

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
loadingsplot(mod1, ncomp = 1:2)



