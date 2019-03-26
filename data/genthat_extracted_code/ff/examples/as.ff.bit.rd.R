library(ff)


### Name: as.ff.bit
### Title: Conversion between bit and ff boolean
### Aliases: as.ff.bit as.bit.ff
### Keywords: classes logic IO data

### ** Examples

  l <- as.boolean(sample(c(FALSE,TRUE), 1000, TRUE))

  b <- as.bit(l)
  stopifnot(identical(l,b[]))
  b
  f <- as.ff(b)
  stopifnot(identical(l,f[]))
  f
  b2 <- as.bit(f)
  stopifnot(identical(l,b2[]))
  b2
  f2 <- as.ff(b2)
  stopifnot(identical(filename(f),filename(f2)))
  stopifnot(identical(l,f2[]))
  f
  rm(f,f2); gc()



