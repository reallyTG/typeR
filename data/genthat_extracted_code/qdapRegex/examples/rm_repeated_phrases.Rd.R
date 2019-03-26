library(qdapRegex)


### Name: rm_repeated_phrases
### Title: Remove/Replace/Extract Repeating Phrases
### Aliases: rm_repeated_phrases ex_repeated_phrases
### Keywords: phrases repeat

### ** Examples

x <- c(
    "this is a big is a Big deal",
    "I want want to see",
    "I want, want to see",
    "I want...want to see see see how",
    "I like it. It is cool",
    "this is a big is a Big deal for those of, those of you who are."
)

rm_repeated_phrases(x)
ex_repeated_phrases(x)



