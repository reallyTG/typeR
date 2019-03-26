library(flacco)


### Name: convertInitDesignToGrid
### Title: Converts an Initial Design into a Cell Mapping Grid
### Aliases: convertInitDesignToGrid

### ** Examples

# (1) create an initial design:
X = t(replicate(n = 200, expr = runif(n = 5, min = -10, max = 10)))
f = function(x) sum(x^2)
y = apply(X = X, MARGIN = 1, FUN = f)
init = data.frame(X, y = y)

# (2) compute the cell mapping grid
convertInitDesignToGrid(init = init, lower = -10, upper = 10, blocks = 20)




