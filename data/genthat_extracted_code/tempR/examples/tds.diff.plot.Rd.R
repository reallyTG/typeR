library(tempR)


### Name: tds.diff.plot
### Title: Plot TDS difference curves
### Aliases: tds.diff.plot

### ** Examples

# example using 'bars' data set
bars.m <- aggregate(bars[, -c(1:4)], list(samples = bars$sample, attribute = bars$attribute), mean)
bars.m <- bars.m[order(bars.m$sample, bars.m$attribute), ]
attributes <- unique(bars$attribute)
times <- get.times(colnames(bars.m)[-c(1:2)])
bar1 <- bars.m[bars.m$sample == 1, -c(1:2)]
bar2 <- bars.m[bars.m$sample == 2, -c(1:2)]
diff.1vs2 <- get.smooth(bar1 - bar2, low.bound = -1, up.bound = 1)
tds.diff.plot(diff.1vs2, times = times, attributes = attributes,
                lwd = 2, main = "TDS Differences (Bar 1 - Bar 2)")

# suppose we only want to show the curves where the difference in dominance rate
# is significantly different
# get samples sizes and dominance counts for each product
bars.s <- aggregate(bars[, -c(1:4)], list(samples = bars$sample, attribute = bars$attribute), sum)
bars.s <- bars.s[order(bars.s$sample, bars.s$attribute), ]
bar1.s <- bars.s[bars.s$sample == 1, -c(1:2)]
bar2.s <- bars.s[bars.s$sample == 2, -c(1:2)]
bar1.n <- nrow(unique(bars[bars$sample == 1, 1:2]))
bar2.n <- nrow(unique(bars[bars$sample == 2, 1:2]))

# prop.test2 is a wrapper for prop.test (with its default parameters)
# thus it will run chi-squared test with Yates continuity correction
prop.test2 <-  function(x1, x2, n1, n2, alpha = 0.05){
  return((suppressWarnings(prop.test(c(x1,x2), c(n1, n2),
          alternative = "two.sided"))$p.value < alpha) %in% TRUE)
}
# find significant pairwise comparison, treating data as if independent
diff_1v2.signif <- mapply(prop.test2, unlist(bar1.s), unlist(bar2.s), bar1.n, bar2.n)
# update smoothed difference matrix with NA where non-significant pairs
diff_1v2.signif[!diff_1v2.signif] <- NA
diff.1vs2 <- diff.1vs2 + diff_1v2.signif - 1
# line segments that are non-significant are missing/NA so not plotted
tds.diff.plot(diff.1vs2, times = times, attributes = attributes,
              lwd = 2, main = "TDS Differences (Bar 1 - Bar 2)")



