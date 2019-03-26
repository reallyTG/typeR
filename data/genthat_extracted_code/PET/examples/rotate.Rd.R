library(PET)


### Name: rotate
### Title: Rotates Data
### Aliases: rotate
### Keywords: math

### ** Examples

# Rotation of a vector
(x <- c(1:5))
rotate(x,270)
rm(x)

# Rotation of a matrix
(A <- matrix(1:15, nrow=3))
rotate(A, -90)
rm(A)

# Rotation of an array
(A <- array(1:20, c(2,5,2)))
rotate(A, 180)
rm(A)



