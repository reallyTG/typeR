library(CHNOSZ)


### Name: util.array
### Title: Functions to Work with Multidimensional Arrays
### Aliases: util.array list2array slice dimSums slice.affinity

### ** Examples

# start with a matrix
x <- matrix(1:12,ncol=3)
# pay attention to the following when
# writing examples that test for identity!
identical(1*x,x)   # FALSE
# create two matrices that are multiples of the first
a <- 1*x
b <- 2*a
# these both have two dimensions of lengths 4 and 3
dim(a)  # 4 3
# combine them to make an array with three dimensions
c <- list2array(list(a,b))
# the third dimension has length 2
dim(c)  # 4 3 2
# the first slice of the third dimension == a
stopifnot(identical( slice(c,3), a ))
# the second slice of the third dimension == b
stopifnot(identical( slice(c,3,2), b ))
# 'slice' works just like the bracket operator
c11 <- slice(c,1)
c12 <- slice(c,1,2)
c21 <- slice(c,2,1)
c212 <- slice(c,2,1:2)
stopifnot(identical( c11, c[1,,] ))
stopifnot(identical( c12, c[2,,] ))
stopifnot(identical( c21, c[,1,] ))
stopifnot(identical( c212, c[,1:2,] ))
# let us replace part of the array
d <- slice(c,3,2,value=a)
# now the second slice of the third dimension == a
stopifnot(identical( slice(d,3,2), a ))
# and the sum across the third dimension == b
stopifnot(identical( dimSums(d,3), b ))
# taking the sum removes that dimension
dim(d)             # 4 3 2
dim(dimSums(d,1))  # 3 2
dim(dimSums(d,2))  # 4 2
dim(dimSums(d,3))  # 4 3

# working with an 'affinity' object
## Don't show: 
data(thermo)
## End(Don't show)
basis("CHNOS+")
species("alanine")
a1 <- affinity(O2=c(-80,-60))   # at pH=7
a2 <- affinity(O2=c(-80,-60),pH=c(0,14,7))
# in the 2nd dimension (pH) get the 4th slice (pH=7)
a3 <- slice.affinity(a2,2,4)
stopifnot(all.equal(a1$values,a3$values))



