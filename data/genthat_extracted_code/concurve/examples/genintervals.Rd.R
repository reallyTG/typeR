library(concurve)


### Name: genintervals
### Title: Produce Compatibility Intervals for Linear Models
### Aliases: genintervals

### ** Examples

# Simulate random data

GroupA<-rnorm(50)
GroupB<-rnorm(50)

RandomData<-data.frame(GroupA, GroupB)

rob<-glm(GroupA ~ GroupB, data=RandomData)
bob<-genintervals(rob, "GroupB", method="lm")




