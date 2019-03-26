library(tm)


### Name: VectorSource
### Title: Vector Source
### Aliases: VectorSource

### ** Examples

docs <- c("This is a text.", "This another one.")
(vs <- VectorSource(docs))
inspect(VCorpus(vs))



