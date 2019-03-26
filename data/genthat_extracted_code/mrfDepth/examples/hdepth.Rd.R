library(mrfDepth)


### Name: hdepth
### Title: Halfspace depth of points relative to a dataset
### Aliases: hdepth
### Keywords: multivariate

### ** Examples

# Compute the halfspace depth of a simple
# two-dimensional dataset. 
data(cardata90)
Result <- hdepth(x = cardata90)
mrainbowplot(cardata90, depths = Result$depthZ)

# In two dimensions we may also opt to use the
# approximate algorithm. The number of directions
# may be specified through the option list.
options <- list(type = "Rotation",
                ndir = 750,
                approx = TRUE)
Result <- hdepth(x = cardata90, options = options)
# The resulting halfspace depth is monotone decreasing 
# in the number of directions.
options <- list(type = "Rotation",
                ndir = 10,
                approx = TRUE)
Result1 <- hdepth(x = cardata90, options = options)
options <- list(type = "Rotation",
                ndir = 500,
                approx = TRUE)
Result2 <- hdepth(x = cardata90, options = options)
which(Result1$depthZ - Result2$depthZ < 0)
# This is however not the case when the seed is changed
options <- list(type = "Rotation",
                ndir = 10,
                approx = TRUE)
Result1 <- hdepth(x = cardata90, options = options)
options <- list(type = "Rotation",
                ndir = 50,
                approx = TRUE,
                seed = 897)
Result2 <- hdepth(x = cardata90, options = options)
which(Result1$depthZ - Result2$depthZ < 0)
plot(Result1$depthZ - Result2$depthZ,
     xlab = "Index", ylab = "Difference in halfspace depth")

# We can also consider directions through two data
# points. If the sample is small enough one may opt
# to search over all choose(n,2) directions.
# Note that the computational load increases dramatically
# as n becomes larger.
options <- list(type = "Rotation",
                ndir = "all",
                approx = TRUE)
Result1 <- hdepth(x = cardata90, options = options)

# Alternatively one may consider randomly generated directions.
options <- list(type = "Shift",
                ndir = 250,
                approx = TRUE)
Result1 <- hdepth(x = cardata90, options = options)



