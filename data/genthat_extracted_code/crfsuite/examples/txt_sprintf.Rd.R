library(crfsuite)


### Name: txt_sprintf
### Title: 'NA' friendly version of sprintf
### Aliases: txt_sprintf

### ** Examples

sprintf("(w-1):%s", c("xyz", NA, "abc"))
txt_sprintf("(w-1):%s", c("xyz", NA, "abc"))
sprintf("(w-1):%s_%s", c("xyz", NA, "abc"), c(NA, "xyz", "abc"))
txt_sprintf("(w-1):%s_%s", c("xyz", NA, "abc"), c(NA, "xyz", "abc"))



