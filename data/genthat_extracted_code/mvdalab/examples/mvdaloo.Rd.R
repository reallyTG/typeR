library(mvdalab)


### Name: mvdaloo
### Title: Leave-one-out routine for 'mvdareg' objects
### Aliases: mvdaloo

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
        ncomp = 2, method = "bidiagpls", validation = "loo")

mod1$validation$cvR2
mod1$validation$PRESS
mod1$validation$MSPRESS
mod1$validation$RMSPRESS
mod1$validation$in.bag  



