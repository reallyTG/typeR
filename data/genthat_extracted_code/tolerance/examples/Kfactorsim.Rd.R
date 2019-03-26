library(tolerance)


### Name: K.factor.sim
### Title: Estimating K-factors for Simultaneous Tolerance Intervals Based
###   on Normality
### Aliases: K.factor.sim
### Keywords: file

### ** Examples
 
## Reproducing part of Table B5 from Krishnamoorthy and 
## Mathew (2009).

n_sizes <- c(2:20, seq(30, 100, 10))
l_sizes <- 2:10
KM_table <- sapply(1:length(l_sizes), function(i)
                   sapply(1:length(n_sizes), function(j)
                   round(K.factor.sim(n = n_sizes[j], 
                   l = l_sizes[i], side=1, alpha = 0.1, 
                   P = 0.9),3)))
dimnames(KM_table) <- list(n = n_sizes, l = l_sizes)
KM_table




