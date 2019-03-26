library(ppclust)


### Name: ppclust2
### Title: Convert 'ppclust' objects to the other types of cluster objects
### Aliases: ppclust2

### ** Examples

data(iris)
# Create a object of ppclust
opc <- fcm(x=iris[,1:4], centers=3)

# Test the class of opc object
is.ppclust(opc)

# Convert ppclust object 'opc' to the fanny object
ofc <- ppclust2(opc, otype="fanny")

# Test the class of 'ofc' for ppclust
is.ppclust(ofc)

# Test the class of 'ofc'
class(ofc)

# Convert ppclust object 'opc' to fclust object
ofc <- ppclust2(opc, otype="fclust")

# Test the class of 'ofc'
class(ofc)



