library(xts)


### Name: window.xts
### Title: Extract time windows from an 'xts' series
### Aliases: window.xts
### Keywords: ts

### ** Examples

## xts example
x.date <- as.Date(paste(2003, rep(1:4, 4:1), seq(1,19,2), sep = "-"))
x <- xts(matrix(rnorm(20), ncol = 2), x.date)
x

window(x, start = "2003-02-01", end = "2003-03-01")
window(x, start = as.Date("2003-02-01"), end = as.Date("2003-03-01"))
window(x, index = x.date[1:6], start = as.Date("2003-02-01"))
window(x, index = x.date[c(4, 8, 10)])

## Assign to subset
window(x, index = x.date[c(4, 8, 10)]) <- matrix(1:6, ncol = 2)
x



