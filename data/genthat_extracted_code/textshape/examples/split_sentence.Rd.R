library(textshape)


### Name: split_sentence
### Title: Split Sentences
### Aliases: split_sentence split_sentence.default
###   split_sentence.data.frame

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
split_sentence(x)

data(DATA)
split_sentence(DATA)

## Not run: 
##D ## Kevin S. Dias' sentence boundary disambiguation test set
##D data(golden_rules)
##D library(magrittr)
##D 
##D golden_rules %$%
##D     split_sentence(Text)
## End(Not run)



