library(tm)


### Name: SimpleCorpus
### Title: Simple Corpora
### Aliases: SimpleCorpus

### ** Examples

txt <- system.file("texts", "txt", package = "tm")
(ovid <- SimpleCorpus(DirSource(txt, encoding = "UTF-8"),
                      control = list(language = "lat")))



