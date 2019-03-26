library(virtualspecies)


### Name: generateSpFromPCA
### Title: Generate a virtual species distribution with a PCA of
###   environmental variables
### Aliases: generateSpFromPCA

### ** Examples

# Create an example stack with four environmental variables
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)
env <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
             raster(a * 1:100),
             raster(a * logisticFun(1:100, alpha = 10, beta = 70)),
             raster(t(a)))
names(env) <- c("var1", "var2", "var3", "var4")
plot(env) # Illustration of the variables





# Generating a species with the PCA

generateSpFromPCA(raster.stack = env)

# The top part of the plot shows the PCA and the response functions along
# the two axes.
# The bottom part shows the probabilities of occurrence of the virtual
# species.





# Defining manually the response to axes

generateSpFromPCA(raster.stack = env,
           means = c(-2, 0),
           sds = c(0.6, 1.5))
           
# This species can be seen as occupying intermediate altitude ranges of a
# conic mountain.


# Beyond the first two axes
generateSpFromPCA(raster.stack = env,
                  axes = c(1, 3))
                  
sp <- generateSpFromPCA(raster.stack = env,
                  axes = 1:3)
plotResponse(sp, axes = c(1, 2))
plotResponse(sp, axes = c(1, 3))
plotResponse(sp, axes = c(2, 3))
           



