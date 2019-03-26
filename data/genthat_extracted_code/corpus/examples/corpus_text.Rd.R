library(corpus)


### Name: corpus_text
### Title: Text Objects
### Aliases: as_corpus_text as_corpus_text.character as_corpus_text.Corpus
###   as_corpus_text.corpus as_corpus_text.corpus_json
###   as_corpus_text.corpus_text as_corpus_text.data.frame
###   as_corpus_text.default corpus_text is_corpus_text
### Keywords: classes

### ** Examples

as_corpus_text("hello, world!")
as_corpus_text(c(a = "goodnight", b = "moon")) # keeps names

# set a filter property
as_corpus_text(c(a = "goodnight", b = "moon"), stemmer = "english") 

is_corpus_text("hello") # FALSE, "hello" is character, not text



