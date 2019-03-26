library(virtualspecies)


### Name: plotResponse
### Title: Visualise the response of the virtual species to environmental
###   variables
### Aliases: plotResponse

### ** Examples

# Create an example stack with four environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100),
             raster(a * logisticFun(1:100, alpha = 10, beta = 70)),
             raster(t(a)))
names(env) <- c("var1", "var2", "var3", "var4")

# Per-variable response approach:
parameters <- formatFunctions(var1 = c(fun = 'dnorm', mean = 0.00012,
                                       sd = 0.0001),
                              var2 = c(fun = 'linearFun', a = 1, b = 0),
                              var3 = c(fun = 'quadraticFun', a = -20, b = 0.2, 
                                       c = 0),
                              var4 = c(fun = 'logisticFun', alpha = -0.001, 
                                       beta = 0.002))
sp1 <- generateSpFromFun(env, parameters, plot = TRUE)
plotResponse(sp1)

# PCA approach:
sp2 <- generateSpFromPCA(env, plot = FALSE)
par(mfrow = c(1, 1))
plotResponse(sp2)




