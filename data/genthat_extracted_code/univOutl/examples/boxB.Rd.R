library(univOutl)


### Name: boxB
### Title: BoxPlot based outlier detection
### Aliases: boxB
### Keywords: univar survey

### ** Examples


set.seed(321)
x <- rnorm(30, 50, 10)
x[10] <- 1
x[20] <- 100

out <- boxB(x = x, k = 1.5, method = 'asymmetric')
out$fences
out$outliers
x[out$outliers]

out <- boxB(x = x, k = 1.5, method = 'adjbox')
out$fences
out$outliers
x[out$outliers]

x[24] <- NA
x.ids <- paste0('obs',1:30)
out <- boxB(x = x, k = 1.5, method = 'adjbox', id = x.ids)
out$excluded
out$fences
out$outliers

set.seed(111)
w <- round(runif(n = 30, min=1, max=10))
out <- boxB(x = x, k = 1.5, method = 'adjbox', id = x.ids, weights = w)
out$excluded
out$fences
out$outliers




