library(Renext)


### Name: gofExp.test
### Title: Goodness-of-fit test for exponential distribution
### Aliases: gofExp.test

### ** Examples

 ## a sample of size 30
 x <- rexp(30)
 res <- gofExp.test(x)

 ## ns samples: p.values should look as uniform on (0, 1)
 ns <- 100
 xmat <- matrix(rexp(30*ns), nrow = ns, ncol = 30)
 p.values <- apply(xmat, 1, function(x) gofExp.test(x)$p.value)
 plot(sort(p.values), type = "p", pch = 16)
 



