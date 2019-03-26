library(DetMCD)


### Name: inQn
### Title: Test function for the qn
### Aliases: inQn
### Keywords: multivariate robust

### ** Examples

set.seed(123)	#for reproductibility
x<-rnorm(101)
inQn(x)
#should be the same:
pcaPP::qn(x)



