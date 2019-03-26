library(qlcMatrix)


### Name: unfold
### Title: Unfolding of Arrays
### Aliases: unfold unfold_to_matrix tenmat
### Keywords: array tensor unfolding

### ** Examples

# example from \url{http://www.cs.cornell.edu/cv/SummerSchool/Unfold.pdf}
x <- array(c(111, 211, 311, 411, 121, 221, 321, 
    421, 131, 231, 331, 431, 112, 212, 312, 412, 
    122, 222, 322, 422, 132, 232, 332, 432), dim = c(4, 3, 2))
x

s <- as.simple_sparse_array(x)
( s1  <- as.array(unfold_to_matrix(s,1)) )

# note this is identical to:
( s23 <- as.array(unfold(s,c(2,3))) )
all.equal(s23, s1)

# larger example from same source
x <- array(0, dim = c(2,3,2,2,3))
x[1,2,1,1,2] <- 12112
x[2,3,1,2,2] <- 23122
x[2,2,2,1,1] <- 22211
x[2,2,1,2,3] <- 22123
s <- as.simple_sparse_array(x)

as.array(unfold_to_matrix(s, c(1,2,3), c(4,5)))

# use attribute "permutation" to track dimensions
# first step: unfold 1,2,3 to become dimension 3
# original dimensions 4,5 now become 1,2
s1 <- unfold(s, c(1,2,3))
( p1 <- attr(s1, "permutation") )

# now take these dimension 1,2 (originally 4,5) and unfold them
s2 <- unfold(s1, c(1,2))
( p2 <- attr(s2, "permutation") )

# use subsetting to track dimensions through subsequent unfolding
p2[p1]



