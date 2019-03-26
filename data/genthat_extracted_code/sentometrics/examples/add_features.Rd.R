library(sentometrics)


### Name: add_features
### Title: Add feature columns to a (sento)corpus object
### Aliases: add_features

### ** Examples

data("usnews", package = "sentometrics")

set.seed(505)

# construct a corpus and add (a) feature(s) to it
corpus <- quanteda::corpus_sample(sento_corpus(corpusdf = usnews), 500)
corpus1 <- add_features(corpus,
                        featuresdf = data.frame(random = runif(quanteda::ndoc(corpus))))
corpus2 <- add_features(corpus,
                        keywords = list(pres = "president", war = "war"),
                        do.binary = FALSE)
corpus3 <- add_features(corpus,
                        keywords = list(pres = c("Obama", "US president")))
corpus4 <- add_features(corpus,
                        featuresdf = data.frame(all = 1),
                        keywords = list(pres1 = "Obama|US [p|P]resident",
                                        pres2 = "\\bObama\\b|\\bUS president\\b",
                                        war = "war"),
                        do.regex = c(TRUE, TRUE, FALSE))

sum(corpus3$documents$pres) == sum(corpus4$documents$pres2) # TRUE

# adding a complementary feature
nonpres <- data.frame(nonpres = as.numeric(!quanteda::docvars(corpus3)[["pres"]]))
corpus3 <- add_features(corpus3,
                        featuresdf = nonpres)




