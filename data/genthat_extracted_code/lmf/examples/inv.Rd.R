library(lmf)


### Name: inv
### Title: Calculate the inverse of a matrix
### Aliases: inv

### ** Examples

#Example matrix
mat <- matrix(c(1, 0.5, -3, 0.5, 3, 0.5, -3, 0.5, 12), ncol = 3)
#Show that it is positive definite
eigen(mat)$values
#Calculate inverse
inv(mat)



