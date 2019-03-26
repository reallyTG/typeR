library(Inventorymodel)


### Name: mwhcct
### Title: MWHCCT
### Aliases: mwhcct

### ** Examples

mwhcct(n=3,a=10,av=c(0,10,10,10,20,20,20,30),d=c(1,0.95,0.9),K=c(1,1,1),
cooperation=1,allocation = 1)
# MWHC with Transportation Costs model
#Cooperative case
#[1] "Shapley Value"
#$`Optimal solution`
#  1 2 3   Coalition Cost
#1 0 0 0           0  0.0
#2 1 0 0     '{ 1 }' 20.0
#3 0 1 0     '{ 2 }' 19.0
#4 0 0 1     '{ 3 }' 18.0
#5 1 1 0   '{ 1,2 }' 30.0
#6 1 0 1   '{ 1,3 }' 30.0
#7 0 1 1   '{ 2,3 }' 28.5
#8 1 1 1 '{ 1,2,3 }' 40.0
#
#$`Allocation R rule`
#      1     2  3
#  13.75 13.25 13



