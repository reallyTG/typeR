library(mcompanion)


### Name: mc.0chain.struct
### Title: Compute structural Jordan chains for zero eigenvalues
### Aliases: mc.0chain.struct
### Keywords: mcchain internal

### ** Examples

y742t <- mc.0chain.struct(7, 4, 2) # sort = TRUE is default
y742f<- mc.0chain.struct(7, 4, 2, sort = FALSE)

o <- order(y742f[[2]], decreasing = TRUE)
y742fa <- lapply(y742f, function(x) x[o])
stopifnot(identical(y742t, y742fa))



