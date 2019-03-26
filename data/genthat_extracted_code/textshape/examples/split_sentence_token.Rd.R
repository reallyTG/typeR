library(textshape)


### Name: split_sentence_token
### Title: Split Sentences & Tokens
### Aliases: split_sentence_token split_sentence_token.default
###   split_sentence_token.data.frame

### ** Examples

(x <- c(paste0(
    "Mr. Brown comes! He says hello. i give him coffee.  i will ",
    "go at 5 p. m. eastern time.  Or somewhere in between!go there"
),
paste0(
    "Marvin K. Mooney Will You Please Go Now!", "The time has come.",
    "The time has come. The time is now. Just go. Go. GO!",
    "I don't care how."
)))
split_sentence_token(x)

data(DATA)
split_sentence_token(DATA)

## Not run: 
##D ## Kevin S. Dias' sentence boundary disambiguation test set
##D data(golden_rules)
##D library(magrittr)
##D 
##D golden_rules %$%
##D     split_sentence_token(Text)
## End(Not run)



