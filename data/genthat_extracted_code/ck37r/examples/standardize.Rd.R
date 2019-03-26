library(ck37r)


### Name: standardize
### Title: Rescale variables, possibly excluding some columns
### Aliases: standardize

### ** Examples


library(ck37r)

data(Boston, package = "MASS")

# Don't scale our outcome variable.
data = standardize(Boston, skip_vars = "medv")

summary(data)




