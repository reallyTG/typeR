library(IDPmisc)


### Name: iplot
### Title: Image Scatter Plot for Large Datasets
### Aliases: iplot
### Keywords: hplot

### ** Examples

x <-  rnorm(10000)
y <- atan(rnorm(10000, 0))
iplot(x, y)
iplot(x, pixs = 2)

oma <- c(5,5,0,0)
iplot(iris[,1:2], pixs = 4, oma = oma)
iplot(iris[,"Petal.Width"], iris[,"Species"], pixs = 4, oma = oma)
iplot(x = iris[,"Species"], y = iris[,"Petal.Width"], pixs = 10,border = TRUE,
        xlab = "Species",
        ylab = "Petal Width",
        main = "Iris Species and Petal Width", oma = oma)

iplot(iris$Species, iris$Petal.Width,pixs = 3, minL.axis = 10,
      oma = c(3,6,0,0), mgp = c(4, 1, 0),
      cex.axis = 2, cex.lab = 2, cex.main = 2, main = "Larger fonts")



