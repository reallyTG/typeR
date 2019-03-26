library(virtualspecies)


### Name: generateRandomSp
### Title: Generate a random virtual species distribution from
###   environmental variables
### Aliases: generateRandomSp

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

# More than 6 variables: by default a PCA approach will be used
generateRandomSp(env)

# Manually choosing a response approach
generateRandomSp(env, approach = "response")

# Randomly choosing the approach
generateRandomSp(env, approach = "random")





