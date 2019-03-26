library(virtualspecies)


### Name: convertToPA
### Title: Convert a virtual species distribution (or a suitability raster)
###   into presence-absence
### Aliases: convertToPA

### ** Examples

# Create an example stack with two environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100))
names(env) <- c("variable1", "variable2")

# Creation of the parameter list
parameters <- formatFunctions(variable1 = c(fun = 'dnorm', mean = 0.00012,
                                            sd = 0.0001),
                              variable2 = c(fun = 'linearFun', a = 1, b = 0))
sp1 <- generateSpFromFun(env, parameters, plot = FALSE)

# Conversion into presence-absence with a threshold-based approach
convertToPA(sp1, PA.method = "threshold", beta = 0.2,  plot = TRUE)
convertToPA(sp1, PA.method = "threshold", beta = "random", plot = TRUE)

# Conversion into presence-absence with a probability-based approach
convertToPA(sp1, PA.method = "probability", beta = 0.4, 
              alpha = -0.05, plot = TRUE)
convertToPA(sp1, PA.method = "probability", beta = "random", 
              alpha = -0.1, plot = TRUE)
              
# Conversion into presence-absence by choosing the prevalence
# Threshold method
convertToPA(sp1, PA.method = "threshold",
              species.prevalence = 0.3, plot = TRUE)
# Probability method, with alpha provided              
convertToPA(sp1, PA.method = "probability", alpha = -0.1, 
              species.prevalence = 0.2, plot = TRUE)        
# Probability method, with beta provided              
convertToPA(sp1, PA.method = "probability", beta = 0.5, 
              species.prevalence = 0.2, alpha = NULL, 
              plot = TRUE)    
 
# Plot the output Presence-Absence raster only             
sp1 <- convertToPA(sp1, plot = FALSE)
plot(sp1$pa.raster)



