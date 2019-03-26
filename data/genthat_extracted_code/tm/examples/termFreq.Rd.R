library(tm)


### Name: termFreq
### Title: Term Frequency Vector
### Aliases: termFreq
### Keywords: math

### ** Examples

data("crude")
termFreq(crude[[14]])
strsplit_space_tokenizer <- function(x)
    unlist(strsplit(as.character(x), "[[:space:]]+"))
ctrl <- list(tokenize = strsplit_space_tokenizer,
             removePunctuation = list(preserve_intra_word_dashes = TRUE),
             stopwords = c("reuter", "that"),
             stemming = TRUE,
             wordLengths = c(4, Inf))
termFreq(crude[[14]], control = ctrl)



