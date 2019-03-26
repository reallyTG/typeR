library(virtualspecies)


### Name: removeCollinearity
### Title: Remove collinearity among variables of a a raster stack
### Aliases: removeCollinearity

### ** Examples

# Create an example stack with six environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100),
             raster(a * logisticFun(1:100, alpha = 10, beta = 70)),
             raster(t(a)),
             raster(exp(a)),
             raster(log(a)))
names(env) <- paste("Var", 1:6, sep = "")   
   
# Defaults settings: cutoff at 0.7
removeCollinearity(env, plot = TRUE)

# Changing cutoff to 0.5
removeCollinearity(env, plot = TRUE, multicollinearity.cutoff = 0.5)

# Automatic selection of variables not intercorrelated
removeCollinearity(env, plot = TRUE, select.variables = TRUE)

# Assuming a very large raster file: selecting a subset of points
removeCollinearity(env, plot = TRUE, select.variables = TRUE,
                   sample.points = TRUE, nb.points = 5000)





