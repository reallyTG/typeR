library(denstrip)


### Name: sectioned.density
### Title: Sectioned density plots
### Aliases: sectioned.density panel.sectioned.density
### Keywords: aplot

### ** Examples

## Fisher's iris data 
## Various settings to change the look of the plot
hist(iris$Sepal.Length, nclass=20, col="lightgray")
sectioned.density(iris$Sepal.Length, at=0.2)
sectioned.density(iris$Sepal.Length, at=5)
sectioned.density(iris$Sepal.Length, at=10, width=0.5)
hist(iris$Sepal.Length, nclass=20, col="lightgray")
sectioned.density(iris$Sepal.Length, at=7, width=0.5,
                  offset=0.1, colmax="darkmagenta")
sectioned.density(iris$Sepal.Length, at=9, width=0.5,
                  offset=0.1, ny=15, colmin="lemonchiffon")
## frequency method less smooth than kernel density 
sectioned.density(iris$Sepal.Length, at=12, width=0.5, offset=0.1,
                  method="frequency")
sectioned.density(iris$Sepal.Length, at=13.5, width=0.5, offset=0.1,
                  method="frequency", nx=20)

## Illustrate a known distribution
x <- seq(-4, 4, length=1000)
dens <- dnorm(x)
plot(x, xlim=c(-5, 5), ylim=c(-5, 5), xlab="x", ylab="x", type="n")
sectioned.density(x, dens, ny=8, at=0, width=0.3)
sectioned.density(x, dens, ny=16, at=2, width=0.1)
sectioned.density(x, dens, at=-3, horiz=FALSE)
sectioned.density(x, dens, at=4, width=0.3, horiz=FALSE)




