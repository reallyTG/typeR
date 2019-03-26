library(mvdalab)


### Name: model.matrix
### Title: 'model.matrix' creates a design (or model) matrix.
### Aliases: model.matrix.mvdareg

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
model.matrix(mod1)




