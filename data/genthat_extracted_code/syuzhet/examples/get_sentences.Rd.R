library(syuzhet)


### Name: get_sentences
### Title: Sentence Tokenization
### Aliases: get_sentences

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

get_sentences(x)
get_sentences(x, as_vector = FALSE)





