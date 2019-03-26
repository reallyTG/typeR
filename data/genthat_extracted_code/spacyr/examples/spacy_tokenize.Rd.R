library(spacyr)


### Name: spacy_tokenize
### Title: Tokenize text with spaCy
### Aliases: spacy_tokenize

### ** Examples

## No test: 
spacy_initialize()
txt <- "And now for something completely different."
spacy_tokenize(txt)

txt2 <- c(doc1 = "The fast cat catches mice.\\nThe quick brown dog jumped.", 
          doc2 = "This is the second document.",
          doc3 = "This is a \\\"quoted\\\" text." )
spacy_tokenize(txt2)
## End(No test)



