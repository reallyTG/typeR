library(PTXQC)


### Name: qualUniform
### Title: Compute deviation from uniform distribution
### Aliases: qualUniform

### ** Examples

 stopifnot(qualUniform(c(3,3,3))==1)
 stopifnot(qualUniform(c(4,0,0))==0)         

 ## how 'uniform' is a vector where only a single index has weight?-- answer: very
 stopifnot(qualUniform(c(4,0,0), c(1,0,0))==1)   
 stopifnot(qualUniform(c(4,0,0), c(0,1,0))==1)     
 stopifnot(qualUniform(c(0,4,0))==0)              
 stopifnot(abs(qualUniform(c(3,2,1))-0.58578) < 0.0001)
 stopifnot(abs(qualUniform(c(1,2,3))-0.58578) < 0.0001)
 stopifnot(qualUniform(c(1,2,3), c(0,1,0))==1)   
 stopifnot(abs(qualUniform(c(1,2,3))-0.58578) < 0.0001)
 stopifnot(abs(qualUniform(c(1,2,3), c(0,1,1))- 0.590316) < 0.0001)
 stopifnot(abs(qualUniform(c(2,3), c(1,1))-0.552786) < 0.0001)
 stopifnot(abs(qualUniform(1:120)-0.38661) < 0.0001)
 



