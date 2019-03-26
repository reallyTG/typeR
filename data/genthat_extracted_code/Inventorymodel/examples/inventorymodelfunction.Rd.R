library(Inventorymodel)


### Name: inventorymodelfunction
### Title: inventorymodelfunction
### Aliases: inventorymodelfunction

### ** Examples

inventorymodelfunction(model="MCT",n=3,a=400,av=c(300,500,200),d=c(2,2,5),K=c(9,8,7),
cooperation=1,allocation=1)
#MCT model
#Cooperative case
#Two-lines rule
#$`Optimal solution`
#  1 2 3 Coalition     Cost
#  0 0 0         0   0.0000
#  1 0 0         1 155.5556
#  0 1 0         2 225.0000
#  0 0 1         3 428.5714
#  1 1 0        12 225.0000
#  1 0 1        13 500.0000
#  0 1 1        23 642.8571
#  1 1 1       123 642.8571
#
#$`Allocation two-lines rule`
#[1]   0.0000 219.6429 423.2143



