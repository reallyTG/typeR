library(ggfan)


### Name: geom_fan
### Title: Fan plot visualising intervals of a distribution
### Aliases: geom_fan

### ** Examples


# Basic use. The data frame must have multiple y values for each
# x
library(ggplot2)

ggplot(fake_df, aes(x=x,y=y)) +geom_fan()


# use precomputed quantiles - reducing storage requirements.
intervals = 1:19/20
fake_q <- calc_quantiles(fake_df, intervals=intervals)
# intervals in geom_fan must be the same as used to compute quantiles.
ggplot(fake_q, aes(x=x,y=y, quantile=quantile)) +
 geom_fan(intervals=intervals)


# change the colour scale
ggplot(fake_df, aes(x=x,y=y)) + geom_fan() + scale_fill_gradient(low="red", high="pink")





