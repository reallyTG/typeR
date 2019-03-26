library(cpgen)


### Name: cscanx
### Title: Read in a matrix from a file
### Aliases: cscanx
### Keywords: Tools

### ** Examples


# random matrix
X <- matrix(rnorm(10,5),10,5)

# write that matrix to a file
write.table(X,file="X",col.names=FALSE,row.names=FALSE,quote=FALSE)

# read in the matrix to object Z
Z <- cscanx("X")




