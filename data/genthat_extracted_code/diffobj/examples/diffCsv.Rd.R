library(diffobj)


### Name: diffCsv
### Title: Diff CSV Files
### Aliases: diffCsv diffCsv,ANY-method

### ** Examples

iris.2 <- iris
iris.2$Sepal.Length[5] <- 99
f1 <- tempfile()
f2 <- tempfile()
write.csv(iris, f1, row.names=FALSE)
write.csv(iris.2, f2, row.names=FALSE)
## `pager="off"` for CRAN compliance; you may omit in normal use
diffCsv(f1, f2, pager="off")
unlink(c(f1, f2))



