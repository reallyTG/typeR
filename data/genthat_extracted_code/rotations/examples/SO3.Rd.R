library(rotations)


### Name: as.SO3
### Title: Rotation matrices
### Aliases: as.SO3 as.SO3.data.frame as.SO3.default as.SO3.Q4 as.SO3.SO3
###   id.SO3 is.SO3 SO3
### Keywords: datasets

### ** Examples

data(nickel)                   #Select one location to focus on
Loc698 <- subset(nickel, location == 698)

is.SO3(Loc698[,5:13])          #Some of the rows are not rotations due to rounding or entry errors
                               #as.SO3 will project matrices not in SO(3) to SO(3)

Rs <- as.SO3(Loc698[,5:13])    #Translate the Rs data.frame into an object of class 'SO3'
                               #Rows 4, 6 and 13 are not in SO(3) so they are projected to SO(3)

mean(Rs)                       #Estimate the central orientation with the average
median(Rs)                     #Re-estimate central orientation robustly
Qs <- as.Q4(Rs)                #Coerse into "SO3" format, see ?as.SO3 for more

#Visualize the location, there appears to be two groups
## Not run: 
##D plot(Rs, col = c(1, 2, 3))
## End(Not run)



