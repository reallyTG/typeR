library(epinet)


### Name: BuildX
### Title: Build a dyadic covariate matrix (X)
### Aliases: BuildX
### Keywords: graphs

### ** Examples
# make some nodal covariates
set.seed(3)
mycov = data.frame(id = 1:5, xpos = rnorm(5), ypos = rnorm(5), 
	house = c(1, 1, 2, 2, 2), gender = c(0, 0, 0, 1, 1))
# make matrix 
dyadCov = BuildX(mycov, unaryCol = c(4, 5), unaryFunc = c("match", "match"), 
	binaryCol = list(c(2, 3)), binaryFunc = "euclidean")



