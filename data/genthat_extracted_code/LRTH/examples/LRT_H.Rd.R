library(LRTH)


### Name: LRT_H
### Title: The Function for Likelihood Ratio Test Accounting for Genetic
###   Heterogeneity
### Aliases: LRT_H

### ** Examples

       y = c(rep(1,500),rep(0,500))
       x1 = sample(c(0,1,2),500,replace=TRUE,prob = c(0.64,0.32,0))
       x2 = sample(c(0,1,2),500,replace=TRUE,prob = c(0.49,0.42,0))
       x = c(x1,x2)
       LRT_H(x,y)



