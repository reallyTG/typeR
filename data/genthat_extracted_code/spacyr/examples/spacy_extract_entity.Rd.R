library(spacyr)


### Name: spacy_extract_entity
### Title: Extract named entities from texts using spaCy
### Aliases: spacy_extract_entity

### ** Examples

## No test: 
spacy_initialize()

txt <- c(doc1 = "The Supreme Court is located in Washington D.C.",
         doc2 = "Paul earned a postgraduate degree from MIT.")
spacy_extract_entity(txt)
spacy_extract_entity(txt, output = "list")
## End(No test)



