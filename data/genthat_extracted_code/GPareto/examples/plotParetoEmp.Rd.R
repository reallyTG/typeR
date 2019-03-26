library(GPareto)


### Name: plotParetoEmp
### Title: Pareto front visualization
### Aliases: plotParetoEmp

### ** Examples

#------------------------------------------------------------
# Simple example
#------------------------------------------------------------

x <- c(0.2, 0.4, 0.6, 0.8)
y <- c(0.8, 0.7, 0.5, 0.1)

plot(x, y, col = "green", pch = 20) 

plotParetoEmp(cbind(x, y), col = "green")
## Alternative
plotParetoEmp(cbind(x, y), col = "red", add = FALSE)

## With maximization
plotParetoEmp(cbind(x, y), col = "blue", max = TRUE)

## 3D plots
library(rgl)
set.seed(5)
X <- matrix(runif(60), ncol=3)
Xnd <- t(nondominated_points(t(X)))
plot3d(X)
plot3d(Xnd, col="red", size=8, add=TRUE)
plot3d(x=min(Xnd[,1]), y=min(Xnd[,2]), z=min(Xnd[,3]), col="green", size=8, add=TRUE)
X.range <- diff(apply(X,2,range))
bounds <- rbind(apply(X,2,min)-0.1*X.range,apply(X,2,max)+0.1*X.range)
plotParetoEmp(nondominatedPoints = Xnd, add=TRUE, bounds=bounds, alpha=0.5)




