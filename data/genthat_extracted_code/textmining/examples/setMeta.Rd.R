library(textmining)


### Name: setMeta
### Title: Function to access meta data for textmining objects
### Aliases: setMeta

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
corp <- setMeta(corp, parameter = "language", "pl", 1)
getMeta(corp, parameter = "language", 1)
meta(corp, "title") <- c("T1","T2")
meta(corp, "title")

text <- tmTextDocument("Text document")
text <- setMeta(text, "language", "de")
getMeta(text, "language")
meta(text, "title") <- "New"
meta(text, "title")

parsed <- tmParsed(list(c("Parsed", "doc", "one"), c("Parsed", "two")))
parsed <- setMeta(parsed, parameter = "title",  "New1", 2)
getMeta(parsed, parameter = "title",  2)
meta(parsed, "title") <- c("T1", "T2")
meta(parsed, "title")




