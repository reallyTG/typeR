library(concurve)


### Name: meanintervals
### Title: Produce Compatibility Intervals for Mean Differences
### Aliases: meanintervals

### ** Examples

# Simulate random data
GroupA<-runif(100, min=0, max=100)
GroupB<-runif(100, min=0, max=100)

RandomData<-data.frame(GroupA, GroupB)

bob<-meanintervals(GroupA, GroupB, RandomData)



