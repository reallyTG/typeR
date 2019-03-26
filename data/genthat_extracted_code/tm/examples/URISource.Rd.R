library(tm)


### Name: URISource
### Title: Uniform Resource Identifier Source
### Aliases: URISource

### ** Examples

loremipsum <- system.file("texts", "loremipsum.txt", package = "tm")
ovid <- system.file("texts", "txt", "ovid_1.txt", package = "tm")
us <- URISource(sprintf("file://%s", c(loremipsum, ovid)))
inspect(VCorpus(us))



