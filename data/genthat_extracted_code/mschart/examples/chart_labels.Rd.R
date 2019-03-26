library(mschart)


### Name: chart_labels
### Title: Modify axis and plot labels
### Aliases: chart_labels

### ** Examples

mylc <- ms_linechart(data = browser_ts, x = "date", y = "freq",
  group = "browser")
mylc <- chart_labels(mylc, title = "my title", xlab = "my x label",
  ylab = "my y label")



