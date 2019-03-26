library(DStree)


### Name: predict.DStreebag
### Title: Prediction from bagged Discrete-Time Survival Trees
### Aliases: predict.DStreebag

### ** Examples

data(cost)
## Discretize observed days to years
d.cost<-dis.cost(cost)

# Bagging Tree
bag <- bag(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost[1:330,],nBoot=10)
pred <- predict(bag,newdata=d.cost[331:518,])
pred$MedSurv



