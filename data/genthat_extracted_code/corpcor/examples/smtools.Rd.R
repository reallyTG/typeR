library(corpcor)


### Name: smtools
### Title: Some Tools for Handling Symmetric Matrices
### Aliases: sm2vec sm.index vec2sm
### Keywords: utilities

### ** Examples

# load corpcor library
library("corpcor")

# a symmetric matrix
m = rbind(
 c(3,1,1,0),
 c(1,3,0,1),
 c(1,0,2,0),
 c(0,1,0,2)
)
m

# convert into vector (including the diagonals)
v = sm2vec(m, diag=TRUE)
v.idx = sm.index(m, diag=TRUE)
v
v.idx

# put back to symmetric matrix
vec2sm(v, diag=TRUE)

# convert from vector with specified order of the elements
sv = sort(v)
sv
ov = order(v)
ov
vec2sm(sv, diag=TRUE, order=ov)



