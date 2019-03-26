library(FSA)


### Name: headtail
### Title: Shows rows from the head and tail of a data frame or matrix.
### Aliases: headtail
### Keywords: manip

### ** Examples

headtail(iris)
headtail(iris,10)
headtail(iris,which=c("Sepal.Length","Sepal.Width","Species"))
headtail(iris,which=grep("Sepal",names(iris)))
headtail(iris,n=200)

## Make a matrix for demonstration purposes only
miris <- as.matrix(iris[,1:4])
headtail(miris)
headtail(miris,10)
headtail(miris,addrownums=FALSE)
headtail(miris,10,which=2:4)

## Make a tbl_df type from dplyr ... note how headtail()
## is not limited by the tbl_df restriction on number of
## rows to show (but head() is).
if (require(dplyr)) {
  iris2 <- tbl_df(iris)
  class(iris2)
  headtail(iris2,n=15)
  head(iris2,n=30)
}



