library(comparer)


### Name: print.mbc
### Title: Print mbc class
### Aliases: print.mbc

### ** Examples

m1 <- mbc(function(x) {Sys.sleep(rexp(1, 30));mean(x)},
  function(x) {Sys.sleep(rexp(1, 5));median(x)}, input=runif(100))
print(m1)



