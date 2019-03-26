library(iotools)


### Name: imstrsplit
### Title: Create an iterator for splitting binary or character input into
###   a matrix
### Aliases: imstrsplit
### Keywords: iterator

### ** Examples

  mm <- model.matrix(~., iris)
  f <- file("iris_mm.io", "wb")
  writeBin(as.output(mm), f)
  close(f)
  it <- imstrsplit("iris_mm.io", type="numeric", nsep="\t")
  iris_mm <- it$nextElem()
  print(head(iris_mm))
  unlink("iris_mm.io")



