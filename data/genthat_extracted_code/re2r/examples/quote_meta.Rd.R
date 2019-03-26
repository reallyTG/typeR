library(re2r)


### Name: quote_meta
### Title: Escapes all potentially meaningful regexp characters in
###   'unquoted'.
### Aliases: quote_meta

### ** Examples

quote_meta(c("1.2","abc"))
re2_detect("1+2", "1+2")
re2_detect("1+2", quote_meta("1+2"))
re2_detect("1+2", re2("1+2",literal = TRUE))



