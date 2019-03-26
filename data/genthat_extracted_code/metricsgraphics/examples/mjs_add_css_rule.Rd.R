library(metricsgraphics)


### Name: mjs_add_css_rule
### Title: Add a CSS rule to the rendered htmlwidget
### Aliases: mjs_add_css_rule

### ** Examples

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
  mjs_add_css_rule("{{ID}} .blk { fill:black }") %>%
  mjs_annotate_region("2013-01-01", "2016-01-01", "Crazy times", "blk")



