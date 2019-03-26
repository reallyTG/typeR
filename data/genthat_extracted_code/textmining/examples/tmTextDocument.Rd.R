library(textmining)


### Name: tmTextDocument
### Title: Function to create single tmTextDocument with meta data. The
###   object can store any from of documents: raw (string), parsed or table
###   of words counts.
### Aliases: tmTextDocument

### ** Examples

text <-  tmTextDocument("This is text")
text2 <- tmTextDocument("This is text", language = "en", title = "My test")




