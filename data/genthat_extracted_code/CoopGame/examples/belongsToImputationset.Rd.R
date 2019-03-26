library(CoopGame)


### Name: belongsToImputationset
### Title: Check if point is imputation
### Aliases: belongsToImputationset

### ** Examples

library(CoopGame)
belongsToImputationset(x=c(1,0.5,0.5), v=c(0,0,0,1,1,1,2))

## No test: 
library(CoopGame)
v=c(0,1,2,3,4,5,6)

#Point belongs to imputation set:
belongsToImputationset(x=c(1.5,1,3.5),v)

#Point does not belong to imputation set:
belongsToImputationset(x=c(2.05,2,2),v)
## End(No test)




