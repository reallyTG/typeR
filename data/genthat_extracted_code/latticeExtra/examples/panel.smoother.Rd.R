library(latticeExtra)


### Name: panel.smoother
### Title: Plot a smoothing line with standard error bounds.
### Aliases: panel.smoother
### Keywords: dplot

### ** Examples

set.seed(1)
xy <- data.frame(x = runif(100),
                 y = rt(100, df = 5),
                 y2 = rt(100, df = 5) + 1)

xyplot(y ~ x, xy, panel = function(...) {
       panel.xyplot(...)
       panel.smoother(..., span = 0.9)
})

## per-group layers with glayer (pass `...` to get styles)
xyplot(y + y2 ~ x, xy) +
  glayer(panel.smoother(...))

## natural spline with 5 degrees of freedom
if (require("splines"))
  xyplot(y ~ x, xy) +
    layer(panel.smoother(y ~ ns(x,5), method = "lm"))

## thin plate regression spline with smoothness
## chosen by cross validation (see ?mgcv::gam)
if (require("mgcv"))
  xyplot(y ~ x, xy) +
    layer(panel.smoother(y ~ s(x), method = "gam"))

## simple linear regression with standard errors:
xyplot(y ~ x, xy) +
  layer(panel.smoother(x, y, method = "lm"), style = 2)



