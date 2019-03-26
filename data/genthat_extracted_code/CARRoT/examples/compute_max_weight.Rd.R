library(CARRoT)


### Name: compute_max_weight
### Title: Maximum feasible weight of the predictors
### Aliases: compute_max_weight

### ** Examples

#continuous outcomes

compute_max_weight(runif(100,0,1),'linear')

#binary outcomes

compute_max_weight(rbinom(100,1,0.4),'binary')



