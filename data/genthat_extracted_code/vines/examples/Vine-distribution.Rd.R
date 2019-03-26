library(vines)


### Name: Vine-distribution
### Title: Vine Distribution Functions
### Aliases: dvine dvine-methods dvine,CVine-method dvine,DVine-method
###   pvine pvine-methods pvine,CVine-method pvine,DVine-method rvine
###   rvine-methods rvine,CVine-method rvine,DVine-method
### Keywords: methods distribution multivariate

### ** Examples

dimension <- 3
copulas <- matrix(list(normalCopula(0.5), 
                       claytonCopula(2.75),
                       tCopula(0.75, df = 2), 
                       NULL),
                  ncol = dimension - 1, 
                  nrow = dimension - 1)
vine <- DVine(dimension = dimension, trees = dimension - 1,
              copulas = copulas)
dimnames(vine) <- c("A", "B", "C")

data <- rvine(vine, 1)
dvine(vine, data)
pvine(vine, data)



