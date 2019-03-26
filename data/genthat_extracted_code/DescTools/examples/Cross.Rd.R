library(DescTools)


### Name: Cross
### Title: Vector Cross Product
### Aliases: Cross
### Keywords: array

### ** Examples

Cross(c(1, 2, 3), c(4, 5, 6))  # -3  6 -3

# Triple product can be calculated as:
va <- c(1, 2, 3)
vb <- c(4, 3, 0)
vc <- c(5, 1, 1)

Dot(va, Cross(vb, vc))



