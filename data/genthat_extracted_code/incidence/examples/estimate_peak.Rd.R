library(incidence)


### Name: estimate_peak
### Title: Estimate the peak date of an incidence curve using bootstrap
### Aliases: estimate_peak

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
  peak_data <- estimate_peak(i)
  peak_data
  summary(peak_data$peaks)

  ## show confidence interval
  plot(i) + geom_vline(xintercept = peak_data$ci, col = "red", lty = 2)

  ## show the distribution of bootstrapped peaks
  df <- data.frame(peak = peak_data$peaks)
  plot(i) + geom_density(data = df,
                         aes(x = peak, y = 10 * ..scaled..),
                         alpha = .2, fill = "red", color = "red")

})}




