library(text2vec)


### Name: tokenizers
### Title: Simple tokenization functions for string splitting
### Aliases: tokenizers word_tokenizer char_tokenizer space_tokenizer

### ** Examples

doc = c("first  second", "bla, bla, blaa")
# split by words
word_tokenizer(doc)
#faster, but far less general - perform split by a fixed single whitespace symbol.
space_tokenizer(doc, " ")



