library(qlcVisualize)


### Name: boundary
### Title: Checking boundary parameters vor plotting of 'lmap'
### Aliases: boundary

### ** Examples

data(hessen)

# show impact of the chosen parameters
boundary(hessen$villages, density = 0.1, grid = 20
  , manual = cbind(x = c(8.3, 9.2), y = c(49.9, 50.0)))

# return coordinates
boundary(hessen$villages, plot = FALSE)

# abstract example, showing tightness in action
p <- cbind(c(1:10, 1:10), c(1:10, 10:1))
par(mfrow = c(1,3))
boundary(p, density = 0.005, grid = 20, tightness = "auto")
boundary(p, density = 0.005, grid = 20, tightness = 5)
boundary(p, density = 0.005, grid = 20, tightness = 3)
par(mfrow = c(1,1))




