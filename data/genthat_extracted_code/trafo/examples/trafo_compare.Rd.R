library(trafo)


### Name: trafo_compare
### Title: Compares linear models with transformed dependent variable
### Aliases: trafo_compare

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform with Bickel-Doksum transformation
bd_trafo <- bickeldoksum(object = lm_cars, plotit = FALSE)

# Transform with Box-Cox transformation
bc_trafo <- boxcox(object = lm_cars, method = "skew", plotit = FALSE)

# Compare transformed models
trafo_compare(object = lm_cars, trafos = list(bd_trafo, bc_trafo))



