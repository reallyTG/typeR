library(orderbook)


### Name: orderbook-class
### Title: Class "orderbook"
### Aliases: orderbook-class show,orderbook-method summary,orderbook-method
###   best.bid,orderbook-method best.ask,orderbook-method
###   bid.price.levels,orderbook-method ask.price.levels,orderbook-method
###   total.price.levels,orderbook-method bid.orders,orderbook-method
###   ask.orders,orderbook-method get.order.info,orderbook-method
###   total.orders,orderbook-method mid.point,orderbook-method
###   inside.market,orderbook-method spread,orderbook-method
###   display,orderbook-method reset,orderbook-method
###   [,orderbook,character,ANY,ANY-method copy,orderbook-method
###   bid.price.levels ask.price.levels total.price.levels bid.orders
###   ask.orders total.orders mid.point get.order.info inside.market spread
###   display best.ask best.bid reset [ copy
### Keywords: classes

### ** Examples

library(orderbook)

filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)
ob <- read.orders(ob, 500)

show(ob)
summary(ob)
display(ob)




