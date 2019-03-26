library(inaparc)


### Name: imembones
### Title: Initialization of a crisp membership matrix using a selected
###   cluster
### Aliases: imembones
### Keywords: cluster

### ** Examples

# Generate membership degrees matrix whose last column contains crisp
# membership degrees
u <- imembones(n=10, k=5, mtype="hlc")$u
head(u)
tail(u)

# Generate membership degrees matrix using a seed number
u <- imembones(n=10, k=5, mtype="hrc", numseed=123)$u
head(u)
tail(u)



