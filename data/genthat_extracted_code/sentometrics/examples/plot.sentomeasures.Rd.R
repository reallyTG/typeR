library(sentometrics)


### Name: plot.sentomeasures
### Title: Plot sentiment measures
### Aliases: plot.sentomeasures

### ** Examples

data("usnews", package = "sentometrics")
data("list_lexicons", package = "sentometrics")
data("list_valence_shifters", package = "sentometrics")

# construct a sentomeasures object to start with
corpus <- sento_corpus(corpusdf = usnews)
corpusSample <- quanteda::corpus_sample(corpus, size = 500)
l <- sento_lexicons(list_lexicons[c("LM_en")], list_valence_shifters[["en"]])
ctr <- ctr_agg(howTime = c("equal_weight", "linear"), by = "year", lag = 3)
sentomeasures <- sento_measures(corpusSample, l, ctr)

# plot sentiment measures
plot(sentomeasures, group = "features")

## Not run: 
##D # adjust appearance of plot
##D p <- plot(sentomeasures)
##D p <- p +
##D   scale_x_date(name = "month-year") +
##D   scale_y_continuous(name = "newName")
##D p
## End(Not run)




