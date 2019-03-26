library(qualityTools)


### Name: centerCube-methods
### Title: Get and set methods
### Aliases: centerCube centerCube<- centerCube-methods
###   centerCube,facDesign-method centerCube<-,facDesign-method

### ** Examples

#create a response surface design for k = 3 factors
rsdo = rsmDesign(k = 3)

#split design into two blocks
rsdo = blocking(rsdo, 2)

#set two Center Points per block
centerCube(rsdo) = data.frame(A = c(0,0), B = c(0,0), C = c(0,0))

#get the centerPoints of the cube portion
centerCube(rsdo)



