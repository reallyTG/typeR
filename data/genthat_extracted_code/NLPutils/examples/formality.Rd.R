library(NLPutils)


### Name: formality
### Title: Document Formality Annotator
### Aliases: QDAP_Formality_Annotator

### ** Examples

require("NLP")
doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))
s <- content(doc)
a <- annotation(doc)

formality_annotator <- QDAP_Formality_Annotator()
formality_annotator(s, a)



