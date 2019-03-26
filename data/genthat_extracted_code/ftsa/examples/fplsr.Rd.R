library(ftsa)


### Name: fplsr
### Title: Functional partial least squares regression
### Aliases: fplsr
### Keywords: models

### ** Examples

# When weight = FALSE, all observations are assigned equally.
# When weight = TRUE, all observations are assigned geometrically decaying weights.
fplsr(ElNino, order = 6, type = "nipals")
fplsr(data = ElNino, order = 6)
fplsr(data = ElNino, weight = TRUE)
fplsr(data = ElNino, unit.weights = FALSE)
fplsr(data = ElNino, unit.weights = FALSE, weight = TRUE)

# The prediction intervals are calculated numerically.
fplsr(data = ElNino, interval = TRUE, method = "delta")

# The prediction intervals are calculated by bootstrap method. 
fplsr(data = ElNino, interval = TRUE, method = "boota")



