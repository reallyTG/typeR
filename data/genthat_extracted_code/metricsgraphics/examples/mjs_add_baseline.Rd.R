library(metricsgraphics)


### Name: mjs_add_baseline
### Title: Sets a baseline line/label
### Aliases: mjs_add_baseline

### ** Examples

data.frame(
  year=seq(1790, 1970, 10),
  uspop=as.numeric(uspop)
) %>%
  mjs_plot(x=year, y=uspop) %>%
  mjs_line() %>%
  mjs_add_marker(1850, "Something Wonderful") %>%
  mjs_add_baseline(150, "Something Awful")



