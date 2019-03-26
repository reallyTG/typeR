library(virtualspecies)


### Name: generateSpFromBCA
### Title: Generate a virtual species distribution from a Between Component
###   Analysis of environmental variables
### Aliases: generateSpFromBCA

### ** Examples

# Create two example stacks with four environmental variables each
a <- matrix(rep(dnorm(1:100, 50, sd = 25)), 
            nrow = 100, ncol = 100, byrow = TRUE)

env1 <- stack(raster(a * dnorm(1:100, 50, sd = 25)),
              raster(a * 1:100),
              raster(a),
              raster(t(a)))
names(env1) <- c("var1", "var2", "var3", "var4")
plot(env1) # Illustration of the variables

b <- matrix(rep(dnorm(1:100, 25, sd = 50)), 
            nrow = 100, ncol = 100, byrow = TRUE)

env2 <- stack(raster(b * dnorm(1:100, 50, sd = 25)),
              raster(b * 1:100),
              raster(b),
              raster(t(b)))

names(env2) <- c("var1", "var2", "var3", "var4")
plot(env2) # Illustration of the variables 

# Generating a species with the BCA

generateSpFromBCA(raster.stack.current = env1, raster.stack.future = env2)

# The left part of the plot shows the BCA and the response functions along
# the two axes.
# The top-right part shows environmental suitability of the virtual
# species in the current environment.
# The bottom-right part shows environmental suitability of the virtual
# species in the future environment. 


# Defining manually the response to axes

generateSpFromBCA(raster.stack.current = env1, raster.stack.future = env2,
           means = c(-2, 0),
           sds = c(0.6, 1.5))
   
                   



