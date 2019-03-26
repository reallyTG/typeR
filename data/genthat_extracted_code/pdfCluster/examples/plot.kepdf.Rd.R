library(pdfCluster)


### Name: plot,kepdf-method
### Title: Plot objects of class kepdf
### Aliases: plot.kepdf plot,kepdf-method plot,kepdf,missing-method
### Keywords: hplot

### ** Examples

#1-d example
set.seed(123)
x1 <- rnorm(50)

#normal optimal bandwidth
pdf1a <- kepdf(x1)
#shrink the smoothing parameter
pdf1b <- kepdf(x1, h=0.5*h.norm(x1))

plot(pdf1a, n.grid=50, data=x1, xlab="x1", ylim=c(0, max(c(pdf1a@estimate,
   pdf1b@estimate))))
plot(pdf1b, n.grid=50, lty=2, add=TRUE)

#2-d example
set.seed(123)
x2 <- cbind(rnorm(50),rnorm(50))

pdf2 <- kepdf(x2)

plot(pdf2, n.grid=c(50,50), data=x2)
plot(pdf2, n.grid=c(50,50), method="image")
plot(pdf2, n.grid=c(50,50), method="perspective", phi=30, theta=30)

#3-d example
set.seed(123)
x3 <- cbind(rnorm(50), rnorm(50), rnorm(50))

pdf3 <- kepdf(x3)

plot(pdf3, n.grid=c(50,50,50))
plot(pdf3, n.grid=c(50,50,50), method="image", col = terrain.colors(30))
plot(pdf3, n.grid=c(50,50,50), method="perspective", phi=30, theta=30)



