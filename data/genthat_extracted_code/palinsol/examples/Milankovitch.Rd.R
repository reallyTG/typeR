library(palinsol)


### Name: Milankovitch
### Title: Milankovitch graph for a given astronomical configuration
### Aliases: Milankovitch
### Keywords: misc

### ** Examples

orbit <- c(eps=0.409214, ecc=0.01672393, varpi=4.92251)
M <- Milankovitch(orbit)
plot(M, plot=contour)
plot(M, plot=contour, month=FALSE)



