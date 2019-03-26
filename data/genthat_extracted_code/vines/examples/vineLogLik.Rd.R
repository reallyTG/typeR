library(vines)


### Name: vineLogLik
### Title: Vine Log-likelihood Evaluation
### Aliases: vineLogLik

### ** Examples

dimension <- 3
copulas <- matrix(list(normalCopula(0.5), 
                       claytonCopula(2.75),
                       NULL, NULL),
                  ncol = dimension - 1,
                  nrow = dimension - 1,
                  byrow = TRUE)
vine <- DVine(dimension = dimension, trees = 1, 
              copulas = copulas)

data <- matrix(runif(dimension * 100), 
               ncol = dimension, nrow = 100)
               
vineLogLik(vine, data)



