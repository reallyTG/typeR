library(excursions)


### Name: contourmap
### Title: Contour maps and contour map quality measures for latent
###   Gaussian models
### Aliases: contourmap

### ** Examples

n = 10
Q = Matrix(toeplitz(c(1, -0.5, rep(0, n-2))))
mu = seq(-5, 5, length=n)
lp <- contourmap(mu,Q,n.levels = 2,
                 compute=list(F=FALSE, measures = c("P1","P2")),
                 max.threads=1)
#Plot the contourmap
plot(lp$map)
#Display the quality measures
cat(c(lp$P1,lp$P2))



