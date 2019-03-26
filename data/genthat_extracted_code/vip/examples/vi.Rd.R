library(vip)


### Name: vi
### Title: Variable Importance
### Aliases: vi

### ** Examples

#
# A projection pursuit regression example
#

# Load the sample data
data(mtcars)

# Fit a projection pursuit regression model
mtcars.ppr <- ppr(mpg ~ ., data = mtcars, nterms = 1)

# Compute variable importance scores
vi(mtcars.ppr, method = "ice")

# Plot variable importance scores
vip(mtcars.ppr, method = "ice")



