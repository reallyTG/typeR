library(msgl)


### Name: msgl.algorithm.config
### Title: Create a new algorithm configuration
### Aliases: msgl.algorithm.config

### ** Examples

data(SimData)

# A quick look at the data
dim(x)
table(classes)

# Create configuration
config <- msgl.algorithm.config(verbose = FALSE)

lambda <- msgl::lambda(x, classes, alpha = .5, d = 50,
 lambda.min = 0.05, algorithm.config = config)

fit <- msgl::fit(x, classes, alpha = .5, lambda = lambda,
 algorithm.config = config)




