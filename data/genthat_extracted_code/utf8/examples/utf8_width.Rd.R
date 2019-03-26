library(utf8)


### Name: utf8_width
### Title: Measure the Character String Width
### Aliases: utf8_width

### ** Examples

# the second element is encoded in latin-1, but declared as UTF-8
x <- c("fa\u00E7ile", "fa\xE7ile", "fa\xC3\xA7ile")
Encoding(x) <- c("UTF-8", "UTF-8", "bytes")

# get widths
utf8_width(x)
utf8_width(x, encode = FALSE)
utf8_width('"')
utf8_width('"', quote = TRUE)



