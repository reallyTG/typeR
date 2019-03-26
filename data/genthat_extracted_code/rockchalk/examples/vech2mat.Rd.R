library(rockchalk)


### Name: vech2mat
### Title: Convert a half-vector (vech) into a matrix.
### Aliases: vech2mat

### ** Examples

x <- 1:6
vech2mat(x)
vech2mat(x, diag = 7)
vech2mat(x, diag = c(99, 98, 97, 96))
vech2mat(x, diag = 0, lowerOnly = TRUE)



