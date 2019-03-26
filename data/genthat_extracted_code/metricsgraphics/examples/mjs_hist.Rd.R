library(metricsgraphics)


### Name: mjs_hist
### Title: Shortcut for plotting MetricsGraphics histograms
### Aliases: mjs_hist

### ** Examples

bimod <- c(rnorm(1000, 0, 1), rnorm(1000, 3, 1))

mjs_plot(bimod) %>% mjs_histogram()
bimod %>% mjs_hist()

mjs_plot(bimod) %>% mjs_histogram(bins=30)
bimod %>% mjs_hist(30)



