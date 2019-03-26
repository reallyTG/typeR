library(profExtrema)


### Name: getAllMaxMin
### Title: Coordinate profile extrema with BFGS optimization
### Aliases: getAllMaxMin

### ** Examples

if (!requireNamespace("DiceKriging", quietly = TRUE)) {
stop("DiceKriging needed for this example to work. Please install it.",
     call. = FALSE)
}
# Compute the coordinate profile extrema with full optimization on 2d example

# Define the function
g=function(x){
  return(-branin(x))
}
# Define the gradient
gprime = function(x){
  x1 = x[1]*15-5
  x2 = x[2]*15
  f1prime = (15*25)/(4*pi^4)*x1^3 - (15*75)/(2*pi^3)*x1^2 +
  (80*15)/(pi^2)*x1 - (5*15)/(pi^2)*x2*x1 +
  10*15/pi*x2 - 60*15/pi-10*15* (1 - 1/(8*pi))*sin(x1)
  f2prime = 2*15*(x2-5/(4*pi^2)*x1^2 +5/pi*x1-6)
  return(c(-f1prime,-f2prime))
}
# set up dimension
coordProf<-getAllMaxMin(f = g,fprime = gprime,d=2,options = list(multistart=4,heavyReturn=TRUE))

## No test: 
# Consider threshold=-10
threshold<- -10
# obtain the points where the profiles take the threshold value
pp_change<-getChangePoints(threshold = threshold,allRes = coordProf)
# evaluate g at a grid and plot the image
x<-seq(0,1,,100)
grid<-expand.grid(x,x)
g_evals<- apply(X = grid,MARGIN = 1,FUN = g)
image(x = x,y = x,z = matrix(g_evals,nrow = 100),col = grey.colors(20))
contour(x=x,y=x,z=matrix(g_evals,nrow = 100), add=TRUE, nlevels = 20)
contour(x=x,y=x,z=matrix(g_evals,nrow = 100), add=TRUE, levels = threshold,col=2)
abline(h = pp_change$neverEx$`-10`[[2]],col="darkgreen",lwd=2)
abline(v = pp_change$neverEx$`-10`[[1]],col="darkgreen",lwd=2)
# Plot the coordinate profiles and a threshold
plotMaxMin(allRes = coordProf,threshold = threshold,changes = TRUE)
## End(No test)



