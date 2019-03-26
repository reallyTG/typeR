library(DStree)


### Name: predict.DStree
### Title: Predictions from a fitted DStree Object
### Aliases: predict.DStree

### ** Examples

data(cost)
# Convert observed days to years
d.cost<-dis.cost(cost)

# Train Data
Train<-d.cost[1:300,]
# Test Data
Test<-d.cost[301:518,]

fit <- DStree(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost)

#Predictions from Test Data
predict(fit,Test)



