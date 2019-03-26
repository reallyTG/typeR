library(tm)


### Name: readPlain
### Title: Read In a Text Document
### Aliases: readPlain

### ** Examples

docs <- c("This is a text.", "This another one.")
vs <- VectorSource(docs)
elem <- getElem(stepNext(vs))
(result <- readPlain(elem, "en", "id1"))
meta(result)



