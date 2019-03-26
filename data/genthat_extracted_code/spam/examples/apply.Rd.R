library(spam)


### Name: apply
### Title: Apply Functions Over Sparse Matrix Margins
### Aliases: apply.spam
### Keywords: array algebra

### ** Examples

S <- as.spam(dist(1:5))
S <- apply.spam(S/2, NULL, exp)
# instead of 
# S@entries <- exp( S@entries/2) 

# Technical detail, a null matrix consists
# of one zero element.
apply.spam(S,c(1,2),pmax)
apply.spam(S,1,range)


# A similar example as for the base apply.
# However, no dimnames else we would get warnings. 
x <- as.spam(cbind(x1 = 3, x2 = c(0,0,0, 5:2)))
apply.spam(x, 2, mean, trim = .2)
col.sums <- apply.spam(x, 2, sum)
row.sums <- apply.spam(x, 1, sum)
rbind(cbind(x, row.sums), c(col.sums, sum(col.sums)))

apply.spam(x, 2, is.vector)

# Sort the columns of a matrix
# Notice that the result is a list due to the different
# lengths induced by the nonzero elements
apply.spam(x, 2, sort)

# Function with extra args:
cave <- function(x, c1, c2) c(mean(x[c1]), mean(x[c2]))
apply(x,1, cave,  c1=1, c2=c(1,2))

ma <- spam(c(1:4, 0, 0,0, 6), nrow = 2)
ma
apply.spam(ma, 1, table)  #--> a list of length 2
apply.spam(ma, 1, stats::quantile)# 5 x n matrix with rownames



