library(ggfan)


### Name: geom_interval
### Title: Line plot visualising intervals of a distribution
### Aliases: geom_interval

### ** Examples


library(ggplot2)
# Basic use. The data frame must have multiple y values for each
# x
ggplot(fake_df, aes(x=x,y=y)) +geom_interval()


# use precomputed quantiles - reducing storage requirements.
intervals = c(0,50,90)/100
fake_q <- calc_quantiles(fake_df, intervals=intervals)
# intervals in geom_fan must be the same as used to compute quantiles.
ggplot(fake_q, aes(x=x,y=y, quantile=quantile)) +
 geom_interval(intervals=intervals)





