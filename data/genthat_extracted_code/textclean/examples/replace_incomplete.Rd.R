library(textclean)


### Name: replace_incomplete
### Title: Denote Incomplete End Marks With "|"
### Aliases: replace_incomplete
### Keywords: incomplete-sentence

### ** Examples

x <- c("the...",  "I.?", "you.", "threw..", "we?")
replace_incomplete(x)
replace_incomplete(x, '...')



