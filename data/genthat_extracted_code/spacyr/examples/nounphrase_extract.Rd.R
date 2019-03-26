library(spacyr)


### Name: nounphrase_extract
### Title: Extract or consolidate noun phrases from parsed documents
### Aliases: nounphrase_extract nounphrase_consolidate

### ** Examples

## No test: 
spacy_initialize()

# entity extraction
txt <- "Mr. Smith of moved to San Francisco in December."
parsed <- spacy_parse(txt, nounphrase = TRUE)
entity_extract(parsed)
## End(No test)
## No test: 
# consolidating multi-word noun phrases
txt <- "The House of Representatives voted to suspend aid to South Dakota."
parsed <- spacy_parse(txt, nounphrase = TRUE)
nounphrase_consolidate(parsed)
## End(No test)



