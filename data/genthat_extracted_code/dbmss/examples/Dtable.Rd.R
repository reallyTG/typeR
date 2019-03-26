library(dbmss)


### Name: Dtable
### Title: Create a Distance table object.
### Aliases: Dtable

### ** Examples

# A Dtable containing two points
Dmatrix <- matrix(c(0,1,1,0), nrow=2)
PointType <- c("Type1", "Type2")
PointWeight <- c(2,3)
Dtable(Dmatrix, PointType, PointWeight)



