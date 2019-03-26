library(qdapRegex)


### Name: rm_repeated_words
### Title: Remove/Replace/Extract Repeating Words
### Aliases: rm_repeated_words ex_repeated_words
### Keywords: repeat words

### ** Examples

x <- c(
    "this is a big is a Big deal",
    "I want want to see",
    "I want, want to see",
    "I want...want to see see see how",
    "I like it. It is cool",
    "this is a big is a Big deal for those of, those of you who are."
)

rm_repeated_words(x)
ex_repeated_words(x)



