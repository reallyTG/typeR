library(bayesloglin)


### Name: bayesloglin
### Title: Bayesian analysis of contingency table data
### Keywords: htest models

### ** Examples

data(czech)
s1 <- MC3 (init = NULL, alpha = 1, iterations = 5, 
           replicates = 1, data = czech, mode = "Decomposable")
s2 <- MC3 (init = NULL, alpha = 1, iterations = 5,   
            replicates = 1, data = czech, mode = "Graphical")
s3 <- MC3 (init = NULL, alpha = 1, iterations = 5,   
            replicates = 1, data = czech, mode = "Hierarchical")



