library(NLP)


### Name: features
### Title: Extract Annotation Features
### Aliases: features

### ** Examples

## Use a pre-built annotated plain text document,
## see ? AnnotatedPlainTextDocument.
doc <- readRDS(system.file("texts", "stanford.rds", package = "NLP"))
## Extract features of all *word* annotations in doc:
x <- features(doc, "word")
## Could also have abbreviated "word" to "w".
x
## Only lemmas:
x$lemma
## Words together with lemmas:
paste(words(doc), x$lemma, sep = "/")



