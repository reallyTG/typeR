library(dplR)


### Name: bai.out
### Title: Basal Area Increment (Outside In)
### Aliases: bai.out
### Keywords: manip

### ** Examples

library(graphics)
library(utils)
## Not run: 
##D library(stats)
##D ## Toy
##D n <- 100
##D ## Make three fake tree-ring series to show that these funcs work on rwl objects
##D base.series <- 0.75 + exp(-0.2 * 1:n)
##D rwl <- data.frame(x1 = base.series + abs(rnorm(n, 0, 0.05)),
##D                   x2 = base.series + abs(rnorm(n, 0, 0.05)),
##D                   x3 = base.series + abs(rnorm(n, 0, 0.05)))
##D 
##D ## The inside out method
##D foo <- bai.in(rwl = rwl)
##D ## The outside in method
##D bar <- bai.out(rwl = rwl)
##D 
##D ## Identical
##D head(bar)
##D head(foo)
## End(Not run)
## Use gp data
data(gp.rwl)
data(gp.dbh)
## dbh (minus the bark) from cm to mm 
gp.dbh2 <- gp.dbh[, 1:2]
gp.dbh2[, 2] <- (gp.dbh[, 2] - gp.dbh[, 3]) * 10
bar <- bai.out(rwl = gp.rwl, diam = gp.dbh2)
bar.crn <- chron(bar)
yrs <- time(bar.crn)
plot(yrs, bar.crn[, 1], type = "n",
     xlab = "Year", ylab = expression(mm^2))
lines(yrs, bar.crn[, 1], col = "grey", lty = "dashed")
lines(yrs, ffcsaps(bar.crn[, 1], nyrs = 32), col = "red", lwd = 2)



