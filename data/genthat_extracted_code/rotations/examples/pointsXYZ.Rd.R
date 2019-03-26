library(rotations)


### Name: pointsXYZ
### Title: Project rotation data onto sphere
### Aliases: pointsXYZ

### ** Examples

Rs<-ruars(20, rcayley)

#Project the sample's 3 axes onto the 3-shere centered at the identity rotation

pointsXYZ(Rs, center = id.SO3, column = 1)  #x-axis
pointsXYZ(Rs, center = id.SO3, column = 2)  #y-axis
pointsXYZ(Rs, center = id.SO3, column = 3)  #z-axis



