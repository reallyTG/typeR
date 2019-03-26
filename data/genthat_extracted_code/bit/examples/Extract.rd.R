library(bit)


### Name: Extract
### Title: Extract or replace part of an bit vector
### Aliases: [[.bit [[<-.bit [.bit [<-.bit
### Keywords: classes logic

### ** Examples

  x <- as.bit(c(FALSE, NA, TRUE))
  x[] <- c(FALSE, NA, TRUE)
  x[1:2]
  x[-3]
  x[ri(1,2)]
  x[as.bitwhich(c(TRUE,TRUE,FALSE))]
  x[[1]]
  x[] <- TRUE
  x[1:2] <- FALSE
  x[[1]] <- TRUE



