library(GEVcdn)


### Name: gevcdn.evaluate
### Title: Evaluate parameters from trained GEV CDN model
### Aliases: gevcdn.evaluate

### ** Examples

# Generate synthetic data

x <- as.matrix(1:50)
y <- as.matrix(rgev(length(x), location = 0, scale = 1, shape = 0.2))

## Fit stationary model

weights <- gevcdn.fit(x = x, y = y, Th = gevcdn.identity,
                      fixed = c("location", "scale", "shape"))

## Evaluate GEV parameters

parms <- gevcdn.evaluate(x, weights)
cat("GEV parameters", parms[1,], "\n")



