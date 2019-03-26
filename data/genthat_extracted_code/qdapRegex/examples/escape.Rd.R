library(qdapRegex)


### Name: escape
### Title: Escape Strings From Parsing
### Aliases: escape
### Keywords: escape noparse

### ** Examples

escape("@rm_caps")

x <- "...character vector.  Default, \\code{@rm_caps} uses..."

rm_default(x, pattern = "@rm_caps")
rm_default(x, pattern = escape("@rm_caps"))



