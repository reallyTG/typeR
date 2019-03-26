library(move)


### Name: contour
### Title: Contour plot
### Aliases: contour contour,.UD-method contour,.UDStack-method

### ** Examples

data(leroydbbmm)
## to add a 50% and 95% contour to a plot from DBBMM object dbbmm
plot(leroydbbmm)
contour(leroydbbmm, levels=c(.5,.95), add=TRUE)
contour(leroydbbmm, levels=c(.5,.95))



