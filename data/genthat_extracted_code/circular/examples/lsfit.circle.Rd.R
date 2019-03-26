library(circular)


### Name: lsfit.circle
### Title: Fit a 2D circle to an (x,y) dataset
### Aliases: lsfit.circle print.lsfit.circle
### Keywords: models

### ** Examples


data(coope)
res <- lsfit.circle(x=x.coope, y=y.coope)
res

plot(res)

par(mfcol=c(1,2))
plot(res$angles)
hist(res$radius)

plot(circular(0), type="n", xlim=c(-5.2, 5.2), ylim=c(-5.2, 5.2), 
  xlab="The Radius of the circle \n is measured from the base line of the axes.")
lines(x=res$angles, y=res$radius, join=TRUE, type="b")
ff <- function(x) sqrt((res$coefficients[1]*cos(x))^2+(res$coefficients[1]*sin(x))^2)
curve.circular(ff, add=TRUE, join=TRUE, nosort=FALSE, col=2)

windrose(x=res$angles, y=res$radius)



