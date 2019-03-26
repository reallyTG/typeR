library(zoocat)


### Name: index_detach
### Title: Detach index of a 'zoo' object
### Aliases: index_detach index_detach.zoo

### ** Examples


x.Date <- as.Date("2003-02-01") + c(1, 3, 7, 9, 14) - 1
x <- zoo(rnorm(5), x.Date)
index_detach(x, 3)

y.POSIXct <- ISOdatetime(2003, 02, c(1, 3, 7, 9, 14), 0, 0, 0)
y <- zoo(rnorm(5), y.POSIXct)
index_detach(y, 6)




