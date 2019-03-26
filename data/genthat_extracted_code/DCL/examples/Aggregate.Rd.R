library(DCL)


### Name: Aggregate
### Title: Switch to a higher level of aggregation
### Aliases: Aggregate
### Keywords: manip

### ** Examples

## A dummy example: a run-off triangle with 5*4=20 quarters
m<-20
my.square<-matrix(1,m,m)
# Now my.triangle is a quarterly triangle (the upper left triangle from my.square)
my.triangle<-my.square
my.triangle[row(my.square)+col(my.square)>(m+1)]<-NA
my.yearly.triangle<-Aggregate(my.triangle)
list(original=my.triangle,yearly=my.yearly.triangle)




