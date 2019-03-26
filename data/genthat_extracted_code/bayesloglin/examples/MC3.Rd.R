library(bayesloglin)


### Name: MC3
### Title: Implementation of the MC3 algorithm
### Aliases: MC3 MC3
### Keywords: htest models

### ** Examples

data(czech)
s1 <- MC3 (init = NULL, alpha = 1, iterations = 5, 
            replicates = 1, data = czech, 
            mode = "Decomposable")
s2 <- MC3 (init = NULL, alpha = 1, iterations = 5, 
            replicates = 1, data = czech, 
            mode = "Graphical")
s3 <- MC3 (init = NULL, alpha = 1, iterations = 5, 
            replicates = 1, data = czech, 
            mode = "Hierarchical")



