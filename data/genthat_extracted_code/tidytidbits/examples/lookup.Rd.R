library(tidytidbits)


### Name: lookup
### Title: Lookup in a dictionary
### Aliases: lookup lookup_int lookup_chr lookup_lgl lookup_dbl lookup_num

### ** Examples

a <- list("x", "y", "z")
dict <- c(x="xc", y="yv")
# returns c("xc", "yv", na_chr)
lookup_chr(dict, a)#'
# returns c("xc", "yv", "z")
lookup_chr(dict, "x", "y", "z", default=identity)



