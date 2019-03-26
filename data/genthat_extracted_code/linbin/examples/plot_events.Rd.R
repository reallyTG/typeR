library(linbin)


### Name: plot_events
### Title: Plot Events as Bar Plots
### Aliases: plot_events

### ** Examples

e <- events(from = c(0, 10, 15, 25), to = c(10, 20, 25, 40), length = c(10, 10, 10, 15),
            x = c(1, 2, 1, 1), f = c('a', 'b', 'a', 'a'))
bins <- seq_events(event_coverage(e), c(8, 4, 2, 1))
e.bins <- sample_events(e, bins, list(sum, c('x', 'length')), scaled.cols = 'length')
plot_events(e.bins, group.col = 'group')



