library(orderbook)


### Name: read.orders.function
### Title: read.order
### Aliases: read.orders,orderbook-method read.orders
### Keywords: file

### ** Examples

library(orderbook)
filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)
ob <- read.orders(ob, 100)



