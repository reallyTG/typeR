library(gmp)


### Name: extract
### Title: Extract or Replace Parts of an Object
### Aliases: [.bigz [<-.bigz [[.bigz [[<-.bigz c.bigz rep.bigz length.bigz
###   length<-.bigz [.bigq [<-.bigq [[.bigq [[<-.bigq c.bigq rep.bigq
###   length.bigq length<-.bigq
### Keywords: arith

### ** Examples

  a <- as.bigz(123)
  ## indexing "outside" --> extends the vectors (filling with NA)
  a[2] <- a[1]
  a[4] <- -4

  ## create a vector of 3 a
  c(a,a,a)

  ## repeate a 5 times
  rep(a,5)

  ## with matrix
  m <- matrix.bigz(1:6,3)

  ## these do the same:
  m[1,]
  m[1]
  m[-c(2,3),]
  m[-c(2,3)]
  m[c(TRUE,FALSE,FALSE)]
## Don't show: 
  stopifnot(identical(c(a,a), rep(a,2)),
            identical(rep(a,0), a[FALSE]), length(a[FALSE]) == 0,
            identical(m[1,], m[-(2:3),]),
            identical(m[1,], m[c(TRUE,FALSE,FALSE),])
  )
## End(Don't show)
  ##_modification on matrix
  m[2,-1] <- 11



