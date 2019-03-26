library(bamlss)


### Name: bamlss.engine.helpers
### Title: BAMLSS Engine Helper Functions
### Aliases: bamlss.engine.helpers get.par set.par get.state
###   set.starting.values
### Keywords: regression

### ** Examples

## Create a bamlss.frame.
d <- GAMart()
bf <- bamlss.frame(num ~ s(x1) + s(x2) + te(lon,lat), data = d, family = "gaussian")
names(bf$x$mu$smooth.construct)

## Use the setup function for
## adding state elements.
bf$x <- bamlss.engine.setup(bf$x, df = c("s(x1)" = 1, "s(x2)" = 3))
names(bf$x$mu$smooth.construct)

## Extract regression coefficients.
get.state(bf$x$mu$smooth.construct[["te(lon,lat)"]], "b")

## Extract smoothing variances.
get.state(bf$x$mu$smooth.construct[["te(lon,lat)"]], "tau2")

## More examples.
state <- bf$x$mu$smooth.construct[["te(lon,lat)"]]$state
get.par(state$parameters, "b")
get.par(state$parameters, "tau2")

state$parameters <- set.par(state$parameters, c(0.1, 0.5), "tau2")
get.par(state$parameters, "tau2")

## Setting starting values.
start <- c("mu.s.s(x1).b" = 1:9, "mu.s.s(x1).tau2" = 0.1)
bf$x <- set.starting.values(bf$x, start = start)
get.state(bf$x$mu$smooth.construct[["s(x1)"]], "b")
get.state(bf$x$mu$smooth.construct[["s(x1)"]], "tau2")



