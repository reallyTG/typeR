library(concurve)


### Name: plotpint
### Title: Plot the P-Value Function
### Aliases: plotpint

### ** Examples

# Simulate random data

GroupA<-rnorm(50)
GroupB<-rnorm(50)

RandomData<-data.frame(GroupA, GroupB)
RandomModel<-lm(GroupA ~ GroupB, data=RandomData)

intervalsdf<-genintervals(RandomModel, "GroupB")

p<-plotpint(intervalsdf)
p



