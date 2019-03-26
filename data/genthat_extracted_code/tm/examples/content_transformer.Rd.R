library(tm)


### Name: content_transformer
### Title: Content Transformers
### Aliases: content_transformer

### ** Examples

data("crude")
crude[[1]]
(f <- content_transformer(function(x, pattern) gsub(pattern, "", x)))
tm_map(crude, f, "[[:digit:]]+")[[1]]



