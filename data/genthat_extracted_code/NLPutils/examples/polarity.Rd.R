library(NLPutils)


### Name: polarity
### Title: Sentence Polarity Annotator
### Aliases: QDAP_Polarity_Annotator

### ** Examples

require("NLP")
doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))
s <- content(doc)
a <- annotation(doc)

polarity_annotator <- QDAP_Polarity_Annotator()
polarity_annotator(s, a)



