library(cutpointr)


### Name: roc
### Title: Calculate a ROC curve
### Aliases: roc

### ** Examples

## First two classes of the iris data
dat <- iris[1:100, ]
roc(data = dat, x = "Petal.Width", class = "Species",
pos_class = "versicolor", neg_class = "setosa", direction = ">=")



