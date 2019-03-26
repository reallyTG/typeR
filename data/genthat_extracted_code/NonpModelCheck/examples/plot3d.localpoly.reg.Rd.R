library(NonpModelCheck)


### Name: plot3d.localpoly.reg
### Title: 3d plot from a local polynomial fit
### Aliases: plot3d.localpoly.reg
### Keywords: ~kwd1 ~kwd2

### ** Examples

X = matrix(0,50,2)
X[,1] = runif(50,-2,2)
X[,2] = runif(50,-2,2)
Y = 4*sin(pi*X[,1]) + X[,2] + rnorm(50)

plot3d.localpoly.reg(X,Y, bandwidth="CV2", gridsize = 15, 
degree.pol = 0, gridsurface=20)	





