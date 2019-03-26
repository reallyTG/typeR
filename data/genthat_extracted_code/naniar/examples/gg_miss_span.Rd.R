library(naniar)


### Name: gg_miss_span
### Title: Plot the number of missings in a given repeating span
### Aliases: gg_miss_span

### ** Examples


miss_var_span(pedestrian, hourly_counts, span_every = 3000)
library(ggplot2)
gg_miss_span(pedestrian, hourly_counts, span_every = 3000)
gg_miss_span(pedestrian, hourly_counts, span_every = 3000, facet = sensor_name)
# works with the rest of ggplot
gg_miss_span(pedestrian, hourly_counts, span_every = 3000) + labs(x = "custom")
gg_miss_span(pedestrian, hourly_counts, span_every = 3000) + theme_dark()

gg_miss_span(pedestrian, hourly_counts, span_every = 3000, facet = sensor_name)



