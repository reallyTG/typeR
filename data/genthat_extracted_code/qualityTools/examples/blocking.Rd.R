library(qualityTools)


### Name: blocking
### Title: Blocking
### Aliases: blocking
### Keywords: Design of Experiments Six Sigma

### ** Examples

#create a 2^3 full factorial design
fdo = facDesign(k = 3)

#make it a design with 2 blocks
blocking(fdo, 2)

#create a response surface design for 3 factors
fdo = rsmDesign(k = 3)

#make it a design with 3 blocks (i.e. 1 block for star part and 2 blocks 
#for the cube part)
blocking(fdo, 3)



