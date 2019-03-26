library(textmining)


### Name: setDoc
### Title: Function to change documents for textmining objects
### Aliases: setDoc

### ** Examples

corp <- tmCorpus(c("This is first document", "This is second"))
corp <- setDoc(corp, "Changed doc", 1)
getDoc(corp, 1)
content(corp) <- c("Content 1", "Content 2")
content(corp)

text <- tmTextDocument("Text document new")
text <- setDoc(text, "Content no 1")
getDoc(text)
content(text)

parsed <- tmParsed(list(c("Parsed", "doc", "one"), c("Parsed", "two")))
parsed <- setDoc(parsed, c("Changed", "document"), 2)
getDoc(parsed, 2)
content(parsed) <- list(c("Changed", "document", "one"), c("Changed", "two"))
content(parsed)




