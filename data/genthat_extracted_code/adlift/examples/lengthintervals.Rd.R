library(adlift)


### Name: lengthintervals
### Title: lengthintervals
### Aliases: lengthintervals
### Keywords: arith

### ** Examples

input<-runif(10)
#gridpoint vector
#
I<-intervals(input,"reflect")
#create the interval endpoint vector using the input
#
lengthintervals(input,I,"average",3,TRUE)
#
#computes 'intervals' based on 3 closest neighbour distance averages
#



