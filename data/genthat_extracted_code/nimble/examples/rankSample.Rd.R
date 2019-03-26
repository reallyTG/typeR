library(nimble)


### Name: rankSample
### Title: Generates a weighted sample (with replacement) of ranks
### Aliases: rankSample

### ** Examples

set.seed(1)
sampInts = NA	#sampled integers will be placed in sampInts
rankSample(weights = c(1, 1, 2), size = 10, sampInts)
sampInts
# [1] 1 1 2 2 2 2 2 3 3 3
rankSample(weights = c(1, 1, 2), size = 10000, sampInts)
table(sampInts)
#sampInts
#   1    2    3 
#2434 2492 5074 

#Used in a nimbleFunction
sampGen <- nimbleFunction(setup = function(){
	x = 1:2
},
run = function(weights = double(1), k = integer() ){
	rankSample(weights, k, x)
	returnType(integer(1))
	return(x)
})
rSamp <- sampGen()
rSamp$run(1:4, 5)
#[1] 3 3 4 4 4



