library(vcd)


### Name: WomenQueue
### Title: Women in Queues
### Aliases: WomenQueue
### Keywords: datasets

### ** Examples

data("WomenQueue")
gf <- goodfit(WomenQueue, type = "binomial")
summary(gf)
plot(gf)



