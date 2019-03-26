library(orderbook)


### Name: plot.function
### Title: plot
### Aliases: plot,orderbook-method plot
### Keywords: aplot

### ** Examples

library(orderbook)
filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)
ob <- read.orders(ob, n = 1000)
plot(ob)
plot(ob, type = "o")
plot(ob, type = "sd")
plot(ob, type = "s")



