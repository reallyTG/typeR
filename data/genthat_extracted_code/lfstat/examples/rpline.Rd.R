library(lfstat)


### Name: rpline
### Title: Highlight quantiles/return periods
### Aliases: rpline
### Keywords: low-flow aplot

### ** Examples

data("ngaruroro")
y <- tyears(ngaruroro, dist = "wei", event = 100, plot = TRUE)
rp <- c(1.42, 5, 10)
rpline(y, return.period = rp, suffix = c("a", "m\u00B3"))



