library(sentometrics)


### Name: to_sentiment
### Title: Convert a sentiment table to a sentiment object
### Aliases: to_sentiment

### ** Examples

set.seed(505)

ids <- paste0("id", 1:200)
date <- sample(seq(as.Date("2015-01-01"), as.Date("2018-01-01"), by = "day"), 200, TRUE)
word_count <- sample(150:850, 200, replace = TRUE)
sent <- matrix(rnorm(200 * 8), nrow =  200)
s1 <- s2 <- s3 <- data.table(id = ids, date = date, word_count = word_count, sent)
m <- "method"

colnames(s1)[-c(1:3)] <- paste0(m, 1:8)
sent1 <- to_sentiment(s1)

colnames(s2)[-c(1:3)] <- c(paste0(m, 1:4, "--", "feat1"), paste0(m, 1:4, "--", "feat2"))
sent2 <- to_sentiment(s2)

colnames(s3)[-c(1:3)] <- c(paste0(m, 1:3, "--", "feat1"), paste0(m, 1:3, "--", "feat2"),
                           paste0(m, 4:5))
sent3 <- to_sentiment(s3)

# further aggregation from then on is easy
sentMeas1 <- aggregate(sent1, ctr_agg(lag = 10))




