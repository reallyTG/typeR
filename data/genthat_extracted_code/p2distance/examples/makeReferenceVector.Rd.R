library(p2distance)


### Name: makeReferenceVector
### Title: Make a reference vector
### Aliases: makeReferenceVector
### Keywords: p2distance

### ** Examples

## Create a data frame of 3 variables (indicators) for 6 entities (rows)
dat <- data.frame( 
  		x1=c(10,12,13,14,12,11),
			x2=c(40,51,61,68,34,44),
			x3=c(0.43, 0.41, 0.39, 0.55, 0.60, 0.38))

## Calculate the reference vector (base reference) using minimun value of each variable
makeReferenceVector(dat, reference_vector_function=min)  



