library(textreuse)


### Name: TextReuseTextDocument
### Title: TextReuseTextDocument
### Aliases: TextReuseTextDocument has_content has_hashes has_minhashes
###   has_tokens is.TextReuseTextDocument

### ** Examples

file <- system.file("extdata/legal/ny1850-match.txt", package = "textreuse")
doc  <- TextReuseTextDocument(file = file, meta = list(id = "ny1850"))
print(doc)
meta(doc)
head(tokens(doc))
head(hashes(doc))
## Not run: 
##D content(doc)
## End(Not run)



