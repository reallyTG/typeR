library(spacyr)


### Name: entity_extract
### Title: Extract or consolidate entities from parsed documents
### Aliases: entity_extract entity_consolidate

### ** Examples

## No test: 
spacy_initialize()

# entity extraction
txt <- "Mr. Smith of moved to San Francisco in December."
parsed <- spacy_parse(txt, entity = TRUE)
entity_extract(parsed)
entity_extract(parsed, type = "all")
## End(No test)
## No test: 
# consolidating multi-word entities 
txt <- "The House of Representatives voted to suspend aid to South Dakota."
parsed <- spacy_parse(txt, entity = TRUE)
entity_consolidate(parsed)
## End(No test)



