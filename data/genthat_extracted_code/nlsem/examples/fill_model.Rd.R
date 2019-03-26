library(nlsem)


### Name: fill_model
### Title: Fills an empty structural equation model with parameters
### Aliases: fill_model

### ** Examples

# specify model
model <- specify_sem(num.x = 4, num.y = 1, num.xi = 2, num.eta = 1, 
  xi = "x1-x2,x3-x4", eta = "y1", interaction = "eta1~xi1:xi2")
pars <- runif(count_free_parameters(model))
fill_model(model, parameters = pars)



