library(incidence)


### Name: find_peak
### Title: Find the peak date of an incidence curve
### Aliases: find_peak

### ** Examples


if (require(outbreaks) && require(ggplot2)) { withAutoprint({
  i <- incidence(fluH7N9_china_2013$date_of_onset)
  i
  plot(i)

  ## one simple bootstrap
  x <- bootstrap(i)
  x
  plot(x)

  ## find 95% CI for peak time using bootstrap
  find_peak(i)


  ## show confidence interval
  plot(i) + geom_vline(xintercept = find_peak(i), col = "red", lty = 2)

})}




