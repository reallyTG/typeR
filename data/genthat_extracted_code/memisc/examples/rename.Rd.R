library(memisc)


### Name: rename
### Title: Change Names of a Named Object
### Aliases: rename
### Keywords: manip

### ** Examples

  x <- c(a=1, b=2)
  rename(x,a="A",b="B")
  
  str(rename(iris,
                  Sepal.Length="Sepal_Length",
                  Sepal.Width ="Sepal_Width",
                  Petal.Length="Petal_Length",
                  Petal.Width ="Petal_Width"
                  ))
  str(rename(iris,
                  .="_"
                  ,gsub=TRUE))



