library(simecol)


### Name: p.constrain
### Title: Transform Data Between Unconstrained and Box-constrained Scale
### Aliases: p.constrain p.unconstrain
### Keywords: misc

### ** Examples

xx <- seq(-100, 100, 2)
plot(xx, yy<-p.constrain(xx, -20, 45), type="l")
points(p.unconstrain(yy, -20, 45), yy, col="red")



