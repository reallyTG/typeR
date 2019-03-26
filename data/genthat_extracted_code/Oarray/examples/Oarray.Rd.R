library(Oarray)


### Name: Oarray
### Title: Arrays with arbitrary offsets
### Aliases: Oarray as.Oarray as.array.Oarray is.Oarray Oarray-class
###   slice.index,Oarray-method [.Oarray [<-.Oarray print.Oarray
### Keywords: array

### ** Examples

fred <- Oarray(1:24, 2:4, list(c("sad", "happy"), NULL, NULL),
  offset=rep(7, 3))

tmp <- as.array(fred)
fred1 <- as.Oarray(tmp, offset=rep(7, 3))
stopifnot(identical(fred, fred1))

print.default(fred)  # print method provides numbers for
fred                 # non-named extents

# examples of extraction

fred[] # unclasses fred
fred["sad", 7, -9]
fred["sad", 7, -9, drop=FALSE]
fred[-8, , 7:8]

i <- 8:9; fred[, , i+1]
how.I.feel <- "happy"; fred[how.I.feel, , -(7:8)]

# examples of assignment

fred["sad", 7, -9] <- NA
fred[, , i] <- 100
fred[how.I.feel, , -(7:8)] <- Inf

# now use negative offsets and suppress usual behaviour

fred <- Oarray(24:1, 2:4, offset=c(-1, -2, 7), drop.negative=FALSE)
fred[] <- 1:24
fred[-(1:0), , 7:8]
fred[-(1:0), , 7:8] <- 100
dimnames(fred) <- list(c("sad", "happy"), NULL, NULL)
fred["sad", -2, 10] <- NA


# array and logical indexing

a <- Oarray(0, dim=rep(2,4),offset=rep(0,4))
a[diag(4)] <- 1

a[a == 0] <- NA




