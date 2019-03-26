library(CEGO)


### Name: designMaxMinDist
### Title: Max-Min-Distance Design
### Aliases: designMaxMinDist
### Keywords: internal

### ** Examples

# Create a design of 10 permutations, each with n=5 elements, 
# and with 50 candidates for each sample.
# Note, that in this specific case the number of candidates 
# should be no larger than factorial(n).
# The default (hamming distance) is used.
design <- designMaxMinDist(NULL,function()sample(5),10,
		control=list(budget=50))
# Create a design of 20 real valued 2d vectors, 
# with 100 candidates for each sample
# using euclidean distance.
design <- designMaxMinDist(NULL,function()runif(2),20,
	control=list(budget=100,
	distanceFunction=function(x,y)sqrt(sum((x-y)^2))))
# plot the resulting design
plot(matrix(unlist(design),,2,byrow=TRUE))



