library(iotools)


### Name: readAsRaw
### Title: Read binary data in as raw
### Aliases: readAsRaw

### ** Examples

  mm <- model.matrix(~., iris)
  f <- file("iris_mm.io", "wb")
  writeBin(as.output(mm), f)
  close(f)
  m <- mstrsplit(readAsRaw("iris_mm.io"), type="numeric", nsep="\t")
  head(mm)
  head(m)
  unlink("iris_mm.io")



