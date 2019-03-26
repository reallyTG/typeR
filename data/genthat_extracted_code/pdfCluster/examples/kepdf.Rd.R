library(pdfCluster)


### Name: kepdf
### Title: Kernel estimate of a probability density function.
### Aliases: kepdf
### Keywords: smooth nonparametric

### ** Examples

## A 1-dimensional example
data(wine)
x <- wine[,3] 
pdf <- kepdf(x, eval.points=seq(0,7,by=.1))
plot(pdf, n.grid= 100, main="wine data")

## A 2-dimensional example
x <- wine[,c(2,8)] 
pdf <- kepdf(x)
plot(pdf, main="wine data", props=c(5,50,90), ylim=c(0,4))
plot(pdf, main="wine data", method="perspective", phi=30, theta=60)

### A 3-dimensional example
x <- wine[,c(2,3,8)] 
pdf <- kepdf(x)
plot(pdf, main="wine data", props=c(10,50,70), gap=0.2)
plot(pdf, main="wine data", method="perspective", gap=0.2, phi=30, theta=10)

### A 6-dimensional example
### adaptive kernel density estimate is preferable in high-dimensions
x <- wine[,c(2,3,5,7,8,10)]
pdf <- kepdf(x, bwtype="adaptive")
plot(pdf, main="wine data", props=c(10,50,70), gap=0.2)
plot(pdf, main="wine data", method="perspective", gap=0.2, phi=30, theta=10)




