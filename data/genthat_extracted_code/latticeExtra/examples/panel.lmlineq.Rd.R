library(latticeExtra)


### Name: panel.lmlineq
### Title: Draw a line with a label, by default its equation
### Aliases: panel.lmlineq panel.ablineq
### Keywords: aplot

### ** Examples

set.seed(0)
xsim <- rnorm(50, mean = 3)
ysim <- (0 + 2 * xsim) * (1 + rnorm(50, sd = 0.3))

## basic use as a panel function
xyplot(ysim ~ xsim, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...)
  panel.ablineq(a = 0, b = 2, adj = c(0,1))
  panel.lmlineq(x, y, adj = c(1,0), lty = 2,
                col.line = "grey", digits = 1)
})

## using layers:
xyplot(ysim^2 ~ xsim) +
  layer(panel.ablineq(lm(y ~ x, subset = x <= 3),
    varNames = alist(y = y^2, x = x[x <= 3]), pos = 4))

## rotated equation (depends on device aspect at plotting time)
xyplot(ysim ~ xsim) +
  layer(panel.ablineq(lm(y ~ x), rotate = TRUE, at = 0.8))

## horizontal and vertical lines
xyplot(ysim ~ xsim) +
  layer(panel.ablineq(v = 3, pos = 4, at = 0.1, lty = 2,
                      label = "3.0 (critical value)")) +
  layer(panel.ablineq(h = mean(ysim), pos = 3, at = 0.15, lty = 2,
                      varNames = alist(y = plain(mean)(y))))

## using layer styles, r.squared
xyplot(ysim ~ xsim) +
  layer(panel.ablineq(lm(y ~ x), r.sq = TRUE,
                      at = 0.4, adj=0:1), style = 1) +
  layer(panel.ablineq(lm(y ~ x + 0), r.sq = TRUE,
                      at = 0.6, adj=0:1), style = 2)

## alternative placement of equations
xyplot(ysim ~ xsim) +
  layer(panel.ablineq(lm(y ~ x), r.sq = TRUE, rot = TRUE,
                      at = 0.8, pos = 3), style = 1) +
  layer(panel.ablineq(lm(y ~ x + 0), r.sq = TRUE, rot = TRUE,
                      at = 0.8, pos = 1), style = 2)

update(trellis.last.object(),
  auto.key = list(text = c("intercept", "no intercept"),
                  points = FALSE, lines = TRUE))



