library(tau)


### Name: util
### Title: Preprocessing of Text Documents
### Aliases: tokenize remove_stopwords
### Keywords: utilities character

### ** Examples

txt <- "\"It's almost noon,\" it@dot.net said."
## split
x <- tokenize(txt)
x
## reconstruct
t <- paste(x, collapse = "")
t

if (require("tm", quietly = TRUE)) {
    words <- readLines(system.file("stopwords", "english.dat",
                       package = "tm"))
    remove_stopwords(x, words)
    remove_stopwords(t, words, lines = TRUE)
} else
    remove_stopwords(t, words = c("it", "it's"), lines = TRUE)



