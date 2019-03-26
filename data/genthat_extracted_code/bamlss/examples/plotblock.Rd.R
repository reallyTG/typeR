library(bamlss)


### Name: plotblock
### Title: Factor Variable and Random Effects Plots
### Aliases: plotblock
### Keywords: hplot

### ** Examples

## Generate some data.
set.seed(111)
n <- 500

## Regressors.
d <- data.frame(fac = factor(rep(1:10, n/10)))

## Response.
d$y <- with(d, 1.5 + rnorm(10, sd = 0.6)[fac] + 
  rnorm(n, sd = 0.6))

## Not run: 
##D ## Estimate model.
##D b <- bamlss(y ~ s(fac,bs="re"), data = d)
##D summary(b)
##D 
##D ## Plot random effects.
##D plot(b)
##D 
##D ## Extract fitted values.
##D f <- fitted(b, model = "mu", term = "fac")
##D f <- cbind(d["fac"], f)
##D 
##D ## Now use plotblock.
##D plotblock(f)
##D 
##D ## Variations.
##D plotblock(f, fill.select = c(0, 1, 0, 1), col.poly = "red")
##D plotblock(f, fill.select = c(0, 1, 0, 1), col.poly = "lightgray",
##D   lty = c(2, 1, 2), lwd = c(2, 1, 2))
## End(Not run)

## More examples.
plotblock(y ~ fac, data = d, range = c(0.45, 0.45))

d <- data.frame(fac = factor(rep(1:10, n/10)))
d$y <- with(d, c(2.67, 5, 6, 3, 4, 2, 6, 7, 9, 7.5)[fac])
plotblock(y ~ fac, data = d)
plotblock(cbind(y - 0.1, y + 0.1) ~ fac, data = d)



