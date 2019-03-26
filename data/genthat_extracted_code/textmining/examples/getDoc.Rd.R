library(textmining)


### Name: getDoc
### Title: Function to access documents for textmining objects
### Aliases: getDoc

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
getDoc(corp, 1)
getDoc(corp, 2)
content(corp)

text <- tmTextDocument("Text document new")
getDoc(text)
content(text)

parsed <- tmParsed(list(c("Parsed", "doc", "one"), c("Parsed", "two")))
getDoc(parsed, 2)
content(parsed)




