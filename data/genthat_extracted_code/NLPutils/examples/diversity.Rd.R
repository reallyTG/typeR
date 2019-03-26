library(NLPutils)


### Name: diversity
### Title: Document Diversity Annotator
### Aliases: QDAP_Diversity_Annotator

### ** Examples

require("NLP")
doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))
s <- content(doc)
a <- annotation(doc)

diversity_annotator <- QDAP_Diversity_Annotator()
diversity_annotator(s, a)



