library(inum)


### Name: inum
### Title: Coerse Variables in Data Frames to 'enum' or 'interval'
### Aliases: inum inum.data.frame
### Keywords: data

### ** Examples

data("iris", package = "datasets")
iris[1,1] <- NA
inum(iris, nmax = 5)
inum(iris, nmax = 5, total = TRUE)
inum(iris, nmax = 5, total = TRUE, as.interval = "Sepal.Width",
     complete.cases.only = TRUE)



