library(nlsem)


### Name: count_free_parameters
### Title: Count free parameters of structural equation model
### Aliases: count_free_parameters

### ** Examples

model <- specify_sem(num.x = 4, num.y = 2, num.xi = 2, num.eta = 1, 
  xi = "x1-x2,x3-x4", eta = "y1-y2", interaction = "eta1~xi1:xi2")
count_free_parameters(model)



