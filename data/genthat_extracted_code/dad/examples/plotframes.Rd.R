library(dad)


### Name: plotframes
### Title: Plotting of two sets of variables
### Aliases: plotframes

### ** Examples

require(MASS)
mx <- c(0,0)
vx <- matrix(c(1,0,0,1),ncol = 2) 
my <- c(0,1)
vy <- matrix(c(4,1,1,9),ncol = 2)
x <- as.data.frame(mvrnorm(n = 10, mu = mx, Sigma = vx))
y <- as.data.frame(mvrnorm(n = 10, mu = my, Sigma = vy))
colnames(x) <- c("x1", "x2")
colnames(y) <- c("y1", "y2")
plotframes(x, y)



