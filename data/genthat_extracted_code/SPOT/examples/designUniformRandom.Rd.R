library(SPOT)


### Name: designUniformRandom
### Title: Uniform Design Generator
### Aliases: designUniformRandom

### ** Examples

set.seed(1) #set RNG seed to make examples reproducible
design <- designUniformRandom(,1,2) #simple, 1-D case
design
design <- designUniformRandom(,1,2,control=list(replicates=3)) #with replications
design
design <- designUniformRandom(,c(-1,-2,1,0),c(1,4,9,1),
		control=list(size=5, types=c("numeric","integer","factor","factor")))
design
x <- designUniformRandom(,c(1,-10),c(2,10),control=list(size=5))
x2 <- designUniformRandom(x,c(1,-10),c(2,10),control=list(size=5))
plot(x2)
points(x, pch=19)



