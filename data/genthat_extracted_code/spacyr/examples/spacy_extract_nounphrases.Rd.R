library(spacyr)


### Name: spacy_extract_nounphrases
### Title: Extract noun phrases from texts using spaCy
### Aliases: spacy_extract_nounphrases

### ** Examples

## No test: 
spacy_initialize()

txt <- c(doc1 = "Natural language processing is a branch of computer science.",
         doc2 = "Paul earned a postgraduate degree from MIT.")
spacy_extract_nounphrases(txt)
spacy_extract_nounphrases(txt, output = "list")
## End(No test)



