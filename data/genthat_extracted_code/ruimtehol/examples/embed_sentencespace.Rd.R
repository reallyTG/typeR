library(ruimtehol)


### Name: embed_sentencespace
### Title: Build a Starspace model to be used for sentence embedding
### Aliases: embed_sentencespace

### ** Examples

library(udpipe)
data(brussels_reviews_anno, package = "udpipe")
x <- subset(brussels_reviews_anno, language == "nl")
x$token <- x$lemma
x <- x[, c("doc_id", "sentence_id", "token")]
set.seed(123456789)
model <- embed_sentencespace(x, dim = 15, epoch = 15, 
                             negSearchLimit = 1, maxNegSamples = 2)
plot(model)
sentences <- c("ook de keuken zijn zeer goed uitgerust .",
               "het appartement zijn met veel smaak inrichten en zeer proper .")
predict(model, sentences, type = "embedding")
starspace_embedding(model, sentences)

## Not run: 
##D library(udpipe)
##D data(dekamer, package = "ruimtehol")
##D x <- udpipe(dekamer$question, "dutch", tagger = "none", parser = "none", trace = 100)
##D x <- x[, c("doc_id", "sentence_id", "sentence", "token")]
##D set.seed(123456789)
##D model <- embed_sentencespace(x, dim = 15, epoch = 5, minCount = 5)
##D plot(model)
##D predict(model, "Wat zijn de cijfers qua doorstroming van 2016?", 
##D         basedoc = unique(x$sentence))
##D 
##D embeddings <- starspace_embedding(model, unique(x$sentence), type = "document")
##D dim(embeddings)
##D 
##D sentence <- "Wat zijn de cijfers qua doorstroming van 2016?"
##D embedding_sentence <- starspace_embedding(model, sentence, type = "document")
##D mostsimilar <- embedding_similarity(embeddings, embedding_sentence)
##D head(sort(mostsimilar[, 1], decreasing = TRUE), 3)
##D 
##D ## clean up for cran
##D file.remove(list.files(pattern = ".udpipe$"))
## End(Not run)



