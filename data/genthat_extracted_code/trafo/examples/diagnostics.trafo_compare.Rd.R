library(trafo)


### Name: diagnostics.trafo_compare
### Title: Diagnostics for two differently transformed models
### Aliases: diagnostics.trafo_compare

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
compare <- trafo_compare(object = lm_cars, trafos = list(bd_trafo, bc_trafo))

# Get diagnostics
diagnostics(compare)



