library(excursions)


### Name: contourmap.mc
### Title: Contour maps and contour map quality measures using Monte Carlo
###   samples
### Aliases: contourmap.mc

### ** Examples

n = 100
Q = Matrix(toeplitz(c(1, -0.5, rep(0, n-2))))
mu = seq(-5, 5, length=n)
## Sample the model 100 times (increase for better estimate)
X = mu + solve(chol(Q),matrix(rnorm(n=n*100),nrow=n,ncol=100))

lp <- contourmap.mc(X,n.levels = 2, compute=list(F=FALSE, measures = c("P1","P2")))

#plot contourmap
plot(lp$map)
#display quality measures
c(lp$P1,lp$P2)



