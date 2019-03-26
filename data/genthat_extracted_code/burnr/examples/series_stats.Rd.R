library(burnr)


### Name: series_stats
### Title: Generate series-level descriptive statistics.
### Aliases: series_stats

### ** Examples

data(lgr2)
series_stats(lgr2)

# You can create your own list of statistics to output. You can also create
# your own functions:
flist <- list(n = count_year_span,
              xbar_interval = function(x) mean_interval(x, injury_event = TRUE))
sstats <- series_stats(lgr2)
head(sstats)




