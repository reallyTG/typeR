library(dplR)


### Name: bai.in
### Title: Basal Area Increment (Inside Out)
### Aliases: bai.in
### Keywords: manip

### ** Examples

library(graphics)
library(stats)
library(utils)
## Toy
n <- 100
## Make three fake tree-ring series to show that these funcs work on rwl objects
base.series <- 0.75 + exp(-0.2 * 1:n)
rwl <- data.frame(x1 = base.series + abs(rnorm(n, 0, 0.05)),
                  x2 = base.series + abs(rnorm(n, 0, 0.05)),
                  x3 = base.series + abs(rnorm(n, 0, 0.05)))

## The inside out method
foo <- bai.in(rwl = rwl)
## The outside in method
bar <- bai.out(rwl = rwl)

## Identical
head(bar)
head(foo)

## Use gp data
data(gp.rwl)
data(gp.d2pith)
foo <- bai.in(rwl = gp.rwl, d2pith = gp.d2pith)
foo.crn <- chron(foo)
yrs <- time(foo.crn)
plot(yrs, foo.crn[, 1], type = "n",
     xlab = "Year", ylab = expression(mm^2))
lines(yrs, foo.crn[, 1], col = "grey", lty = "dashed")
lines(yrs, ffcsaps(foo.crn[, 1], nyrs = 32), col = "red", lwd = 2)



