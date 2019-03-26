library(keep)


### Name: keep
### Title: Arrays with Better Control over Dimension Dropping
### Aliases: karray kOarray keep [.keep as.array.keep as.karray as.kOarray
### Keywords: array

### ** Examples

# Normal R array
M <- array(1:12, c(4,3,1))

# First dimension dropped because it has size 1
print(M[,2,])

# Normal R array but with keep class
M2 <- karray(1:12, c(4,3,1))

# First dimension preserved
print(M2[,2,])

# middle dimension dropped for i=3 because 3:3 has length 1
for (i in 1:3) print(M2[,i:3,])

# use keep() to preserve middle dimension
for (i in 1:3) print(M2[,keep(i:3),])

# indexing through arrays works as normal
ind <- as.matrix(expand.grid(1:4,1:3,1:1))
M2[ind]



