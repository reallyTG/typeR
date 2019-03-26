library(cheddar)


### Name: RemoveNodes
### Title: Remove nodes
### Aliases: RemoveNodes
### Keywords: utilities

### ** Examples

data(TL84)

# Three different ways of removing node 56 (Umbra limi)
a <- RemoveNodes(TL84, 56)
b <- RemoveNodes(TL84, 'Umbra limi')
c <- RemoveNodes(TL84, c(rep(FALSE,55), TRUE))

identical(a,b)  # TRUE
identical(a,c)  # TRUE

# The behaviours of the different methods
NumberOfNodes(TL84)         # 56 nodes in total
length(BasalNodes(TL84))    # 25 basal nodes
length(IsolatedNodes(TL84)) #  6 isolated nodes

RemoveNodes(TL84, BasalNodes(TL84)) # 56 - 25 = 31 nodes remain
RemoveNodes(TL84, BasalNodes(TL84), method='secondary') # 14 nodes remain
RemoveNodes(TL84, BasalNodes(TL84), method='cascade')   # 6 isolated nodes remain

# Results in an error
## Not run: RemoveNodes(TL84, 1:NumberOfNodes(TL84))



