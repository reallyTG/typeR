library(corpus)


### Name: corpus_frame
### Title: Corpus Data Frame
### Aliases: as_corpus_frame as_corpus_frame.character
###   as_corpus_frame.Corpus as_corpus_frame.corpus
###   as_corpus_frame.corpus_json as_corpus_frame.corpus_text
###   as_corpus_frame.data.frame as_corpus_frame.default corpus_frame
###   is_corpus_frame
### Keywords: classes

### ** Examples

# convert a data frame:
emoji <- data.frame(text = sapply(0x1f600 + 1:30, intToUtf8),
                    stringsAsFactors = FALSE)
as_corpus_frame(emoji)

# construct directly (no need for stringsAsFactors = FALSE):
corpus_frame(text = sapply(0x1f600 + 1:30, intToUtf8))
    
# convert a character vector:
as_corpus_frame(c(a = "goodnight", b = "moon")) # keeps names
as_corpus_frame(c(a = "goodnight", b = "moon"), row.names = NULL) # drops names



