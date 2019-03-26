library(orderbook)


### Name: view.trade.function
### Title: view.trade
### Aliases: view.trade,orderbook-method next.trade,orderbook-method
###   previous.trade,orderbook-method midpoint.return,orderbook-method
###   previous.trade next.trade view.trade midpoint.return
### Keywords: file

### ** Examples

library(orderbook)
filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)
ob <- next.trade(ob)
view.trade(ob, 1)
midpoint.return(ob, 1, c(5, 10))



