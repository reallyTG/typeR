library(qualityTools)


### Name: starDesign
### Title: Axial Design
### Aliases: starDesign
### Keywords: Design of Experiments Six Sigma design

### ** Examples

#Example 1 - sequential assembly
#factorial design with one center point in the cube portion
fdo = facDesign(k = 3, centerCube = 1)  
fdo

#set the response via generic response method
response(fdo) = 1:9 
 
#sequential assembly of a response surface design (rsd)
rsd = starDesign(data = fdo)  
rsd

#Example 2 - returning a list
starDesign(k = 3, cc = 2, cs = 2, alpha = "orthogonal")
starDesign(k = 3, cc = 2, cs = 2, alpha = "rotatable")
starDesign(k = 3, cc = 2, cs = 2, alpha = "both")



