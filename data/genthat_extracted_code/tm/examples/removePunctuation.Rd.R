library(tm)


### Name: removePunctuation
### Title: Remove Punctuation Marks from a Text Document
### Aliases: removePunctuation removePunctuation.character
###   removePunctuation.PlainTextDocument

### ** Examples

data("crude")
inspect(crude[[14]])
inspect(removePunctuation(crude[[14]]))
inspect(removePunctuation(crude[[14]],
                          preserve_intra_word_contractions = TRUE,
                          preserve_intra_word_dashes = TRUE))



