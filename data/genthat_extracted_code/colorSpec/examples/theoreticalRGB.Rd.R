library(colorSpec)


### Name: theoreticalRGB
### Title: Theoretical RGB Cameras - BT.709.RGB and Adobe.RGB
### Aliases: theoreticalRGB BT.709.RGB Adobe.RGB
### Keywords: datasets

### ** Examples

#######    BT.709.RGB is created using the following recipe  ########
P = matrix( c(0.64,0.33,NA,  0.3,0.6,NA, 0.15,0.06,NA ), 3, 3, byrow=TRUE )
rownames(P) = c('R','G','B')    
BT.709.RGB  = ptransform( xyz1931.1nm, P, D65.1nm )  
quantity(BT.709.RGB) = "energy->electrical"

#######    Adobe.RGB recipe is the same, except for the matrix P  ########
P = matrix( c(0.64,0.33,NA,  0.21,0.71,NA, 0.15,0.06,NA ), 3, 3, byrow=TRUE )
rownames(P) = c('R','G','B')    
Adobe.RGB  = ptransform( xyz1931.1nm, P, D65.1nm )  
quantity(Adobe.RGB) = "energy->electrical"



