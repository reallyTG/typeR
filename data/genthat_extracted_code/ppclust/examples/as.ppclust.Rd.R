library(ppclust)


### Name: as.ppclust
### Title: Convert object to 'ppclust' class
### Aliases: as.ppclust

### ** Examples

data(iris)
# Create an fclust object
ofc <- fclust::FKM(X=iris[,1:4], k=3)

# Test the class of object 'ofc' 
class(ofc)

# Convert 'ofc' to ppclust object
opc <- as.ppclust(ofc)

# Test the class of 'opc' object
class(opc)



