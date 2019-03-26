library(IDPmisc)


### Name: Image
### Title: Display the Density of Points in a Scatter Plot by Colors
### Aliases: Image
### Keywords: aplot

### ** Examples

plot.default(iris$Species, iris$Petal.Width, xlim=c(0.5,3.5),
             type="n", axes=FALSE)
axis(1, at=1:3, labels=levels(iris$Species))
axis(2)
Image(iris$Species, iris$Petal.Width, pixs=3)

##
x <- rnorm(10000)
y <- rnorm(10000, 10)
plot(x+y, y, type="n")
Image(x+y, y)
abline(a=0, b=1)

## The above can be merged to
iplot(x+y, y, legend=FALSE, oma=c(5, 4, 4, 2) + 0.1)
abline(a=0, b=1)



