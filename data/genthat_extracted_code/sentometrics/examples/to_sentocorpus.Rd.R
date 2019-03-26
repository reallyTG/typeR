library(sentometrics)


### Name: to_sentocorpus
### Title: Convert a quanteda corpus object into a sentocorpus object
### Aliases: to_sentocorpus

### ** Examples

data("usnews", package = "sentometrics")

# reshuffle usnews data.frame
dates <- usnews$date
usnews$id <- usnews$date <- NULL
usnews$wrong <- "notNumeric"
colnames(usnews)[1] <- "myTexts"

# set up quanteda corpus object
corpusQ <- quanteda::corpus(usnews, text_field = "myTexts")

# corpus conversion
corpusS <- to_sentocorpus(corpusQ, dates = dates)




