library(ldat)


### Name: partial_sort
### Title: Partial sort an lvec
### Aliases: partial_sort partial_order

### ** Examples

x <- as_lvec(rnorm(100))
y <- partial_sort(x, c(10, 50, 90))
x_sorted <- sort(x)
stopifnot(all(y[c(10, 50, 90)] == x_sorted[c(10, 50, 90)]))
stopifnot(max(y[1:9]) <= min(y[11:100]))
stopifnot(max(y[1:49]) <= min(y[51:100]))
stopifnot(max(y[1:89]) <= min(y[91:100]))




