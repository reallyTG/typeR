library(textmining)


### Name: getMeta
### Title: Function to access meta data for textmining objects
### Aliases: getMeta

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
getMeta(corp, parameter = "language", 1)
getMeta(corp, "title", 2)
meta(corp, "title")

text <- tmTextDocument("Text document")
getMeta(text, "language")
meta(text, "title")

parsed <- tmParsed(list(c("Parsed", "doc", "one"), c("Parsed", "two")))
getMeta(parsed, parameter = "title",  2)
meta(parsed, "title")




