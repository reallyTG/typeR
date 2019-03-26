library(jjb)


### Name: acc
### Title: Accuracy of the Model
### Aliases: acc

### ** Examples

# Set seed for reproducibility
set.seed(100)

# Generate data
n = 1e2

y = round(runif(n))
yhat = round(runif(n))

# Compute
o = acc(y, yhat)



