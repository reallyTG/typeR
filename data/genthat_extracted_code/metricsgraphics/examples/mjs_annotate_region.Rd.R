library(metricsgraphics)


### Name: mjs_annotate_region
### Title: Region annotations for line charts [EXPERIMENTAL]
### Aliases: mjs_annotate_region

### ** Examples

data.frame(year=seq(1790, 1970, 10),
           uspop=as.numeric(uspop)) %>%
  mjs_plot(x=year, y=uspop, title="Population Chart") %>%
  mjs_line() %>%
  mjs_annotate_region(1850, 1900, "Bad stuff") %>%
  mjs_annotate_region(1810, 1830, "Stuff")

set.seed(1492)
stocks <- data.frame(
  time = as.Date('2009-01-01') + (365 * 0:9),
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4))

stocks %>%
  mjs_plot(x=time, y=X) %>%
  mjs_line() %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_annotate_region("2013-01-01", "2016-01-01", "Crazy times")

## custom region color
stocks %>%
  mjs_plot(x=time, y=X) %>%
  mjs_line() %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_add_css_rule("{{ID}} .blk { fill:black }") %>%
  mjs_annotate_region("2013-01-01", "2016-01-01", "Crazy times", "blk")



