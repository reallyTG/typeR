library(DescTools)


### Name: Rename
### Title: Change Names of a Named Object
### Aliases: Rename
### Keywords: manip

### ** Examples

x <- c(a=1, b=2)
Rename(x, a="A", b="B")

str(Rename( iris,
            Sepal.Length="Sepal_Length",
            Sepal.Width ="Sepal_Width",
            Petal.Length="Petal_Length",
            Petal.Width ="Petal_Width"
            ))

str(Rename(iris, .="_", gsub=TRUE))



