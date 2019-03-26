library(latticeExtra)


### Name: rootogram
### Title: Trellis Displays of Tukey's Hanging Rootograms
### Aliases: rootogram rootogram.formula panel.rootogram prepanel.rootogram
### Keywords: dplot

### ** Examples


library(lattice)

x <- rpois(1000, lambda = 50)

p <- rootogram(~x, dfun = function(x) dpois(x, lambda = 50))
p

lambdav <- c(30, 40, 50, 60, 70)

update(p[rep(1, length(lambdav))],
       aspect = "xy",
       panel = function(x, ...) {
           panel.rootogram(x,
                           dfun = function(x)
                           dpois(x, lambda = lambdav[panel.number()]))
       })


lambdav <- c(46, 48, 50, 52, 54)

update(p[rep(1, length(lambdav))],
       aspect = "xy",
       prepanel = function(x, ...) {
           tmp <-
               lapply(lambdav,
                      function(lambda) {
                          prepanel.rootogram(x,
                                             dfun = function(x)
                                             dpois(x, lambda = lambda))
                      })
           list(xlim = range(sapply(tmp, "[[", "xlim")),
                ylim = range(sapply(tmp, "[[", "ylim")),
                dx = do.call("c", lapply(tmp, "[[", "dx")),
                dy = do.call("c", lapply(tmp, "[[", "dy")))
       },
       panel = function(x, ...) {
           panel.rootogram(x,
                           dfun = function(x)
                           dpois(x, lambda = lambdav[panel.number()]))
           grid::grid.text(bquote(Poisson(lambda == .(foo)),
                                  where = list(foo = lambdav[panel.number()])),
                           y = 0.15,
                           gp = grid::gpar(cex = 1.5))
       },
       xlab = "",
       sub = "Random sample from Poisson(50)")


## Example using continuous data

xnorm <- rnorm(1000)

## 'discretize' by binning and replacing data by bin midpoints

h <- hist(xnorm, plot = FALSE)

## Option 1: Assume bin probabilities proportional to dnorm()

norm.factor <- sum(dnorm(h$mids, mean(xnorm), sd(xnorm)))

rootogram(counts ~ mids, data = h,
          dfun = function(x) {
              dnorm(x, mean(xnorm), sd(xnorm)) / norm.factor
          })

## Option 2: Compute probabilities explicitly using pnorm()

pdisc <- diff(pnorm(h$breaks, mean = mean(xnorm), sd = sd(xnorm)))
pdisc <- pdisc / sum(pdisc)

rootogram(counts ~ mids, data = h,
          dfun = function(x) {
              f <- factor(x, levels = h$mids)
              pdisc[f]
          })




