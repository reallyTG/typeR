library(tm)


### Name: PlainTextDocument
### Title: Plain Text Documents
### Aliases: PlainTextDocument

### ** Examples

(ptd <- PlainTextDocument("A simple plain text document",
                          heading = "Plain text document",
                          id = basename(tempfile()),
                          language = "en"))
meta(ptd)



