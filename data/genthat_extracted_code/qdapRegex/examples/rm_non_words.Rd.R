library(qdapRegex)


### Name: rm_non_words
### Title: Remove/Replace/Extract Non-Words
### Aliases: rm_non_words ex_non_words
### Keywords: non-words

### ** Examples

x <- c(
    "I like 56 dogs!",
    "It's seventy-two feet from the px290.",
    NA,
    "What",
    "that1is2a3way4to5go6.",
    "What do you*% want?  For real%; I think you'll see.",
    "Oh some <html>code</html> to remove"
)

rm_non_words(x)
ex_non_words(x)



