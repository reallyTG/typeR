library(RSpincalc)


### Name: DCM2EA
### Title: Convert from Direction Cosine Matrix to Euler Angles
### Aliases: DCM2EA
### Keywords: programming

### ** Examples

DCM <- matrix(c(-0.3573404, -0.1515663, 0.9215940, 0.6460385, 0.6724915, 
0.3610947, -0.6744939, 0.7244189, -0.1423907),3,3,byrow=TRUE)
DCM2EA(DCM,'xyz')



