library(metricsgraphics)


### Name: mjs_histogram
### Title: Plot Histograms with MetrisGraphics
### Aliases: mjs_histogram

### ** Examples

movies <- ggplot2movies::movies[sample(nrow(ggplot2movies::movies), 1000), ]

mjs_plot(movies$rating) %>% mjs_histogram()

mjs_plot(movies, rating) %>%
  mjs_histogram() %>%
  mjs_labs(x_label="Histogram of movie ratings")

mjs_plot(movies$rating) %>%
  mjs_histogram(bins=30)

mjs_plot(runif(10000)) %>%
  mjs_histogram() %>%
  mjs_labs(x_label="runif(10000)")



