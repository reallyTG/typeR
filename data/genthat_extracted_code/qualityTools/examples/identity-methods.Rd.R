library(qualityTools)


### Name: identity-methods
### Title: Get method
### Aliases: identity identity-methods identity,facDesign-method
###   identity,taguchiDesign-method

### ** Examples

#generate a 2^(4-1) factorial design by assigning the interaction ABC 
#to the factor D
vp = fracDesign(k = 4, gen = "D = ABC")

#the defining relation is (D = ABC)*D = I = ABCD. I is the identity.
identity(vp)

#the identity can be seen in the according alias table
aliasTable(vp)



