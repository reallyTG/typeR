library(DStree)


### Name: bag
### Title: Bagging Discrete-Time Survival Trees
### Aliases: bag

### ** Examples

data(cost)
## Discretize observed days to years
d.cost <- dis.cost(cost)# Bagging Tree
pred <- bag(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost,nBoot=50)

# Predicted, averaged probabilities and median survival times for each individual
pred$MedSurv
pred$Surv
pred$Haz



