library(comparer)


### Name: plot.mbc
### Title: Plot mbc class
### Aliases: plot.mbc

### ** Examples

m1 <- mbc(function(x) {Sys.sleep(rexp(1, 30));mean(x)},
  function(x) {Sys.sleep(rexp(1, 5));median(x)}, input=runif(100))
plot(m1)



