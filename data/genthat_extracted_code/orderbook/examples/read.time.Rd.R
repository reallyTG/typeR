library(orderbook)


### Name: read.time.function
### Title: read.time
### Aliases: read.time,orderbook-method read.time
### Keywords: file

### ** Examples

library(orderbook)
filename <- system.file("extdata", "sample.txt",
                        package = "orderbook")

ob <- orderbook(file = filename)
ob <- read.time(ob, "9:30:00")



