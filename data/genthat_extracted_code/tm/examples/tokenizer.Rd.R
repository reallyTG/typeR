library(tm)


### Name: tokenizer
### Title: Tokenizers
### Aliases: Boost_tokenizer MC_tokenizer scan_tokenizer

### ** Examples

data("crude")
Boost_tokenizer(crude[[1]])
MC_tokenizer(crude[[1]])
scan_tokenizer(crude[[1]])
strsplit_space_tokenizer <- function(x)
    unlist(strsplit(as.character(x), "[[:space:]]+"))
strsplit_space_tokenizer(crude[[1]])



