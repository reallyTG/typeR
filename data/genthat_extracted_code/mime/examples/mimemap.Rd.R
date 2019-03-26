library(mime)


### Name: mimemap
### Title: Tables for mapping filename extensions to MIME types
### Aliases: mimemap mimeextra
### Keywords: datasets

### ** Examples

str(as.list(mimemap))
mimemap["pdf"]
mimemap[c("html", "js", "css")]
# additional MIME types (not exported)
mime:::mimeextra



