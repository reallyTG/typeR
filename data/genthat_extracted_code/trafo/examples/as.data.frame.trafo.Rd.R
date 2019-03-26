library(trafo)


### Name: as.data.frame.trafo
### Title: Data frame with transformed variables
### Aliases: as.data.frame.trafo

### ** Examples

# Load data
data("cars", package = "datasets")

# Fit linear model
lm_cars <- lm(dist ~ speed, data = cars)

# Transform dependent variable using divergence minimization following
# Kolmogorov-Smirnov
logshiftopt_trafo <- logshiftopt(object = lm_cars, method = "div.ks", 
plotit = FALSE)

# Get a data frame with the added transformed variable
as.data.frame(logshiftopt_trafo)



