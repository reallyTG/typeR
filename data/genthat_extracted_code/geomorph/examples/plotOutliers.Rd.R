library(geomorph)


### Name: plotOutliers
### Title: Find potential outliers
### Aliases: plotOutliers
### Keywords: utilities

### ** Examples

data(plethodon)
# let's make some outliers
newland <- plethodon$land
newland[c(1,8),,2] <- newland[c(8,1),,2]
newland[c(3,11),,26] <- newland[c(11,3),,2]
Y<- gpagen(newland) # GPA
out <- plotOutliers(Y$coords) # function returns dimnames and address of all specimens ordered
plotOutliers(Y$coords, inspect.outliers = TRUE) # function also produces plots of 
# identified outlier specimens compared to the mean shape

# example with groups
plotOutliers(Y$coords, groups = plethodon$species, inspect.outliers = TRUE)
 



