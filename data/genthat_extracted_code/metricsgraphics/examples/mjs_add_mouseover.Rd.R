library(metricsgraphics)


### Name: mjs_add_mouseover
### Title: Adds a custom rollover to a metricsgraphics chart
### Aliases: mjs_add_mouseover

### ** Examples

set.seed(1492)
dat <- data.frame(date=as.Date('2009-01-01') + 0:9,
                  value=rnorm(10, 0, 2))
dat %>%
  mjs_plot(x=date, y=value) %>%
  mjs_line() %>%
  mjs_axis_x(xax_format = "date") %>%
  mjs_add_mouseover("function(d, i) {
                $('{{ID}} svg .mg-active-datapoint')
                    .text('custom text : ' + d.date + ' ' + i);
                 }")

# slightly different for scatterplots

dat <- data.frame(value=rnorm(n=30, mean=5, sd=1),
                  value2=rnorm(n=30, mean=4, sd=1),
                  test = c(rep(c('test', 'test2'), 15)))

dat %>%
  mjs_plot(x = value, y = value2) %>%
  mjs_point() %>%
  mjs_add_mouseover("function(d, i) {
                $('{{ID}} svg .mg-active-datapoint')
                    .text('custom text : ' + d.point.test + ' ' + i);
                 }")




