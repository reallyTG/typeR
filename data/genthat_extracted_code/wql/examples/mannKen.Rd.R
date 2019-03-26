library(wql)


### Name: mannKen
### Title: Mann-Kendall trend test and the Sen slope
### Aliases: mannKen
### Keywords: ts

### ** Examples


tsp(Nile)  # an annual time series
mannKen(Nile)

y <- sfbayChla
y1 <- interpTs(y, gap=1)  # interpolate single-month gaps only
y2 <- aggregate(y1, 1, mean, na.rm=FALSE)
mannKen(y2)
mannKen(y2, plot=TRUE) # missing data means missing trend estimates
mannKen(y2, plot=TRUE, xlim = c(0.1, 0.25))
mannKen(y2, plot=TRUE, type='relative', order = TRUE, pval = .001,
  xlab = "Relative trend")
legend("topleft", legend = "p < 0.001", pch = 19, bty="n")




