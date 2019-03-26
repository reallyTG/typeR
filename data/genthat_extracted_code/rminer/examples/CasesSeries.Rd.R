library(rminer)


### Name: CasesSeries
### Title: Create a training set (data.frame) from a time series using a
###   sliding window.
### Aliases: CasesSeries
### Keywords: datasets ts

### ** Examples

t=1:20
d=CasesSeries(1:10,c(1,3,4))
print(d)
d=CasesSeries(1:10,c(1,2,3))
print(d)



