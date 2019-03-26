library(udpipe)


### Name: keywords_rake
### Title: Keyword identification using Rapid Automatic Keyword Extraction
###   (RAKE)
### Aliases: keywords_rake

### ** Examples

data(brussels_reviews_anno)
x <- subset(brussels_reviews_anno, language == "nl")
keywords <- keywords_rake(x = x, term = "lemma", group = "doc_id", 
                          relevant = x$xpos %in% c("NN", "JJ"))
head(keywords)

x <- subset(brussels_reviews_anno, language == "fr")
keywords <- keywords_rake(x = x, term = "lemma", group = c("doc_id", "sentence_id"), 
                          relevant = x$xpos %in% c("NN", "JJ"), 
                          ngram_max = 10, n_min = 2, sep = "-")
head(keywords)



