library(phonTools)


### Name: rotate
### Title: Rotate
### Aliases: rotate

### ** Examples


## rotate points in a 2D space 
mat = cbind (1:100, 100:1)
rotate (mat, pi/2)

## rotate complex-valued numbers
complx = complex (real = mat[,1], imaginary = mat[,2])
rotate (complx, pi/2)




