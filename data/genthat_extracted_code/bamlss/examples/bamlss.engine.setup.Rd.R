library(bamlss)


### Name: bamlss.engine.setup
### Title: BAMLSS Engine Setup Function
### Aliases: bamlss.engine.setup
### Keywords: regression models

### ** Examples

d <- GAMart()
bf <- bamlss.frame(num ~ s(x1) + s(x2), data = d, family = "gaussian")
names(bf$x$mu$smooth.construct)
bf$x <- bamlss.engine.setup(bf$x, df = c("s(x1)" = 1, "s(x2)" = 3))
names(bf$x$mu$smooth.construct)
names(bf$x$mu$smooth.construct[["s(x1)"]])
names(bf$x$mu$smooth.construct[["s(x1)"]]$state)
sapply(bf$x$mu$smooth.construct, function(x) {
  c(x$state$edf, get.state(x, "tau2"))
})



