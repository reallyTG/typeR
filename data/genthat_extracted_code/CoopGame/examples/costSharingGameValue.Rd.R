library(CoopGame)


### Name: costSharingGameValue
### Title: Compute value of a coalition for a cost game
### Aliases: costSharingGameValue

### ** Examples

library(CoopGame)
costSharingGameValue(S=c(1,2), Costs=c(2,2,2,3,3,3,4))

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

#Savings when A and B share appartment
library(CoopGame)
costSharingGameValue(S=c(1,2),Costs=c(300,270,280,410,410,410,550))
#Output: 
#[1] 160
## End(No test)




