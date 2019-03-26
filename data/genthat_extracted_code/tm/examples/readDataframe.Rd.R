library(tm)


### Name: readDataframe
### Title: Read In a Text Document from a Data Frame
### Aliases: readDataframe

### ** Examples

docs <- data.frame(doc_id = c("doc_1", "doc_2"),
                   text = c("This is a text.", "This another one."),
                   stringsAsFactors = FALSE)
ds <- DataframeSource(docs)
elem <- getElem(stepNext(ds))
result <- readDataframe(elem, "en", NULL)
inspect(result)
meta(result)



