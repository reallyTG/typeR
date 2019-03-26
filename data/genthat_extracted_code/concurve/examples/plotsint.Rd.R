library(concurve)


### Name: plotsint
### Title: Plot the S-Value Function
### Aliases: plotsint

### ** Examples

# Simulate random data

GroupA<-rnorm(50)
GroupB<-rnorm(50)

RandomData<-data.frame(GroupA, GroupB)
RandomModel<-lm(GroupA ~ GroupB, data=RandomData)

intervalsdf<-genintervals(RandomModel, "GroupB")

s<-plotsint(intervalsdf)
s



