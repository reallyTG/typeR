library(NLPutils)


### Name: stem
### Title: Word Stem Annotator
### Aliases: Snowball_Stem_Annotator

### ** Examples

require("NLP")
doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))
s <- content(doc)
a <- annotation(doc)

stem_annotator <- Snowball_Stem_Annotator()
stem_annotator(s, a)



