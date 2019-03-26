library(vines)


### Name: vinePIT-methods
### Title: Vine Probability Integral Transform Methods
### Aliases: vinePIT vinePIT-methods vinePIT,CVine-method
###   vinePIT,DVine-method
### Keywords: methods

### ** Examples

dimension <- 3
copulas <- matrix(list(normalCopula(0.5), 
                       claytonCopula(2.75),
                       NULL, NULL),
                  ncol = dimension - 1,
                  nrow = dimension - 1,
                  byrow = TRUE)
vine <- CVine(dimension = dimension, trees = 1,
              copulas = copulas)

data <- matrix(runif(dimension * 100), 
               ncol = dimension, nrow = 100)

vinePIT(vine, data)



