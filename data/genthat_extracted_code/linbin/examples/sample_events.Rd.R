library(linbin)


### Name: sample_events
### Title: Sample Events
### Aliases: sample_events

### ** Examples

e <- events(from = c(0, 10, 15, 25), to = c(10, 20, 25, 40), length = c(10, 10, 10, 15), 
            x = c(1, 2, 1, 1), f = c('a', 'b', 'a', 'a'))
bins <- rbind(seq_events(event_coverage(e), 4), c(18, 18))
sample_events(e, bins, list(sum, 'length'))
sample_events(e, bins, list(sum, 'length'), scaled.cols = 'length')
sample_events(e, bins, list(sum, 'length', by = 'f'), scaled.cols = 'length')
sample_events(e, bins, list(weighted.mean, 'x', 'length'), scaled.cols = 'length')
sample_events(e, bins, list(paste0, 'f', collapse = "."))



