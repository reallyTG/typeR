library(tgp)


### Name: exp2d.Z
### Title: Random Z-values for 2-d Exponential Data
### Aliases: exp2d.Z
### Keywords: datagen

### ** Examples

N <- 20
x <- seq(-2,6,length=N)
X <- expand.grid(x, x)
Zdata <- exp2d.Z(X)
persp(x,x,matrix(Zdata$Ztrue, nrow=N), theta=-30, phi=20,
      main="Z true", xlab="x1", ylab="x2", zlab="Ztrue")



