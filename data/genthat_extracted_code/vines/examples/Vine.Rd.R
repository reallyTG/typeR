library(vines)


### Name: Vine
### Title: Create Vine Objects
### Aliases: Vine CVine DVine

### ** Examples

dimension <- 3
copulas <- matrix(list(normalCopula(0.5),
                       claytonCopula(2.75),
                       tCopula(0.75, df = 2),
                       NULL),
                  ncol = dimension - 1,
                  nrow = dimension - 1,
                  byrow = TRUE)

Vine("DVine", dimension = dimension, trees = dimension - 1,
     copulas = copulas)
DVine(dimension = dimension, trees = dimension - 1,
      copulas = copulas)



