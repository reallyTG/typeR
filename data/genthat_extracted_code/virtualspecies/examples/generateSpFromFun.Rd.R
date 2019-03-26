library(virtualspecies)


### Name: generateSpFromFun
### Title: Generate a virtual species distributions with responses to
###   environmental variables
### Aliases: generateSpFromFun

### ** Examples

# Create an example stack with two environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100))
names(env) <- c("variable1", "variable2")
plot(env) # Illustration of the variables

# Easy creation of the parameter list:
# see in real time the shape of the response functions
parameters <- formatFunctions(variable1 = c(fun = 'dnorm', mean = 1e-04, 
                                             sd = 1e-04),
                              variable2 = c(fun = 'linearFun', a = 1, b = 0))
                              
# If you provide env, then you can see the shape of response functions:
parameters <- formatFunctions(x = env,
                              variable1 = c(fun = 'dnorm', mean = 1e-04, 
                                             sd = 1e-04),
                              variable2 = c(fun = 'linearFun', a = 1, b = 0))

# Generation of the virtual species
sp1 <- generateSpFromFun(env, parameters)
sp1
par(mfrow = c(1, 1))
plot(sp1)


# Manual creation of the parameter list
# Note that the variable names are the same as above
parameters <- list(variable1 = list(fun = 'dnorm',
                                    args = list(mean = 0.00012,
                                                sd = 0.0001)),
                   variable2 = list(fun = 'linearFun',
                                    args = list(a = 1, b = 0)))
# Generation of the virtual species
sp1 <- generateSpFromFun(env, parameters, plot = TRUE)
sp1
plot(sp1)



