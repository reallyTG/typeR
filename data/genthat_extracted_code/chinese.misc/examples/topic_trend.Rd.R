library(chinese.misc)


### Name: topic_trend
### Title: Simple Rise or Fall Trend of Several Years
### Aliases: topic_trend

### ** Examples

set.seed(1)
topic <- sample(c("art", "economy", "law", "politics", "sociology"), 50, replace = TRUE)
set.seed(2)
year <- sample(2011: 2016, 50, replace = TRUE)
tr1 <- topic_trend(year, topic)
tr2 <- topic_trend(year, topic, zero = NA)
tr3 <- topic_trend(year, topic, relative=TRUE)



