library(inum)


### Name: interval
### Title: Cut Numeric Vectors into Intervals
### Aliases: interval interval.numeric
### Keywords: data

### ** Examples


(ix <- interval(x <- 0:100/100, breaks = 0:10/10))
(cx <- cut(x, breaks = 0:10/10))

attr(ix, "levels")
levels(ix)
levels(cx)

diag(table(ix, cx))

(ix <- interval(x <- c(NA, 0:100/100), breaks = 0:10/10))
ix[is.na(x)]
unclass(ix)[is.na(x)]




