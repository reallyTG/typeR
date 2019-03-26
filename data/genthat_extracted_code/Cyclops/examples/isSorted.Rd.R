library(Cyclops)


### Name: isSorted
### Title: Check if data are sorted by one or more columns
### Aliases: isSorted isSorted.data.frame isSorted.ffdf

### ** Examples

x <- data.frame(a = runif(1000), b = runif(1000))
x <- round(x, digits=2)
isSorted(x, c("a", "b"))

x <- x[order(x$a, x$b),]
isSorted(x, c("a", "b"))

x <- x[order(x$a,-x$b),]
isSorted(x, c("a", "b"), c(TRUE, FALSE))




