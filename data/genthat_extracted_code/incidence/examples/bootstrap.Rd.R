library(incidence)


### Name: bootstrap
### Title: Bootstrap incidence time series
### Aliases: bootstrap

### ** Examples


if (require(outbreaks) && require(ggplot2)) { withAutoprint({
  i <- incidence(fluH7N9_china_2013$date_of_onset)
  i
  plot(i)

  ## one simple bootstrap
  x <- bootstrap(i)
  x
  plot(x)

})}




