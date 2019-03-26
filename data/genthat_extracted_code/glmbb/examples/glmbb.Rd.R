library(glmbb)


### Name: glmbb
### Title: All Hierarchical or Graphical Models for Generalized Linear
###   Model
### Aliases: glmbb
### Keywords: models regression

### ** Examples

data(crabs)
gout <- glmbb(satell ~ (color + spine + width + weight)^3,
    criterion = "BIC", data = crabs)
summary(gout)



