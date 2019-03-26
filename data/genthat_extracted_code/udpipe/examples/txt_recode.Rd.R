library(udpipe)


### Name: txt_recode
### Title: Recode text to other categories
### Aliases: txt_recode

### ** Examples

x <- c("NOUN", "VERB", "NOUN", "ADV")
txt_recode(x = x,
           from = c("VERB", "ADV"),
           to = c("conjugated verb", "adverb"))



