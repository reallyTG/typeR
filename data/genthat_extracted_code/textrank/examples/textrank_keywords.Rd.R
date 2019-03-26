library(textrank)


### Name: textrank_keywords
### Title: Textrank - extract relevant keywords
### Aliases: textrank_keywords

### ** Examples

data(joboffer)
keywords <- textrank_keywords(joboffer$lemma,
                              relevant = joboffer$upos %in% c("NOUN", "VERB", "ADJ"))
subset(keywords$keywords, ngram > 1 & freq > 1)
keywords <- textrank_keywords(joboffer$lemma,
                              relevant = joboffer$upos %in% c("NOUN"),
                              p = 1/2, sep = " ")
subset(keywords$keywords, ngram > 1)

## plotting pagerank to see the relevance of each word
barplot(sort(keywords$pagerank$vector), horiz = TRUE,
        las = 2, cex.names = 0.5, col = "lightblue", xlab = "Pagerank")



