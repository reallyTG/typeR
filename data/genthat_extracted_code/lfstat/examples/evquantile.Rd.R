library(lfstat)


### Name: evquantile
### Title: Estimating populations quantiles of extreme values
### Aliases: evquantile
### Keywords: low-flow fitting

### ** Examples

data("ngaruroro")

# using tyears is a fast way to produce an object of class evfit
y <- tyears(ngaruroro, dist = "wei", event = 100, plot = TRUE)

# computing quantiles for given return periods
rp <- c(1.42, 5, 10)
evquantile(y, return.period = rp)
rpline(y, return.period = rp, suffix = c("a", "m\u00B3"))



