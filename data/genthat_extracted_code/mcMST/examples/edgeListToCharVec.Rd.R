library(mcMST)


### Name: edgeListToCharVec
### Title: Convert edge list to characteristic vector.
### Aliases: edgeListToCharVec

### ** Examples

# first we generate a small edge list by hand
# (assume the given graph has n = 4 nodes)
edgelist = matrix(c(1, 2, 2, 4, 3, 4), ncol = 3)
print(edgelist)
# next we transform the edge into
# a characteristic vector
cvec = edgeListToCharVec(edgelist, n = 4)
print(cvec)



