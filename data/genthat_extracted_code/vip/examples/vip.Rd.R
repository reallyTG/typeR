library(vip)


### Name: vip
### Title: Variable Importance Plots
### Aliases: vip vip.default

### ** Examples

#
# A projection pursuit regression example
#

# Load the sample data
data(mtcars)

# Fit a projection pursuit regression model
model <- ppr(mpg ~ ., data = mtcars, nterms = 1)

# Construct variable importance plot
vip(model, method = "ice")

# Better yet, store the variable importance scores and then plot
vi_scores <- vi(model, method = "ice")
vip(vi_scores, bar = FALSE, size = 3, horiz = FALSE)

# The \code{\link[magrittr]{%T>%}} operator is imported for convenience
vi_scores <- model %>%
  vi(method = "ice") %T>%
  {print(vip(.))}
vi_scores



