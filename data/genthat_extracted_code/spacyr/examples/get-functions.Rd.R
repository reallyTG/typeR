library(spacyr)


### Name: get-functions
### Title: get functions for spaCy
### Aliases: get-functions get_tokens get_tags get_attrs get_named_entities
###   get_dependency get_noun_phrases get_ntokens get_ntokens_by_sent
### Keywords: internal

### ** Examples

## No test: 
# get_tags examples
txt <- c(text1 = "This is the first sentence.\nHere is the second sentence.", 
         text2 = "This is the second document.")
results <- spacy_parse(txt)
tokens <- tokens(results)
tokens_with_tag <- tokens_tag(tokens)

## End(No test)



