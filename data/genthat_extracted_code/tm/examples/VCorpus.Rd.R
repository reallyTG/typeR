library(tm)


### Name: VCorpus
### Title: Volatile Corpora
### Aliases: VCorpus as.VCorpus

### ** Examples

reut21578 <- system.file("texts", "crude", package = "tm")
VCorpus(DirSource(reut21578, mode = "binary"),
        list(reader = readReut21578XMLasPlain))



