library(orderbook)


### Name: add.order.function
### Title: add.order
### Aliases: add.order,orderbook-method remove.order,orderbook-method
###   replace.order,orderbook-method market.order,orderbook-method
###   add.order remove.order replace.order market.order
### Keywords: classes

### ** Examples

library(orderbook)
filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)

ob <- add.order(ob, price = 123, size = 123, type = "BID", time = 1, id = 1)
ob <- replace.order(ob, 1, 100)
ob <- market.order(ob, 50, "SELL")
ob <- remove.order(ob, 1)



