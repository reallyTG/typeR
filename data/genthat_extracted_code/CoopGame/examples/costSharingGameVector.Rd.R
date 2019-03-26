library(CoopGame)


### Name: costSharingGameVector
### Title: Compute game vector for a cost sharing game
### Aliases: costSharingGameVector

### ** Examples

library(CoopGame)
costSharingGameVector(n=3, Costs=c(2,2,2,3,3,3,4))

## No test: 
#Example with 3 students sharing an appartment:
#-------------------------------
#| costs     |  A  |  B  |  C  |
#- -----------------------------
#|single     | 300 | 270 | 280 |
#|appartment |     |     |     |
#-------------------------------
#
#Appartment for 2 persons => costs: 410
#Appartment for 3 persons => costs: 550

#Savings for all combinations sharing appartments
library(CoopGame)
(v=costSharingGameVector(n=3, Costs=c(300,270,280,410,410,410,550)))
#Output: 
#[1]   0   0   0 160 170 140 300
## End(No test)




