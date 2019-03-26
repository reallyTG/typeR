library(mvdalab)


### Name: mvdaboot
### Title: Bootstrapping routine for 'mvdareg' objects
### Aliases: mvdaboot

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "oob", boots = 300)

## Run line below to see bootstrap results
## mod1$validation



