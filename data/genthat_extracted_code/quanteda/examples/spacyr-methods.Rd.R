library(quanteda)


### Name: spacyr-methods
### Title: Extensions for and from spacy_parse objects
### Aliases: spacyr-methods spacy_parse.corpus

### ** Examples

## Not run: 
##D library("spacyr")
##D spacy_initialize()
##D 
##D txt <- c(doc1 = "And now, now, now for something completely different.",
##D          doc2 = "Jack and Jill are children.")
##D parsed <- spacy_parse(txt)
##D ntype(parsed)
##D ntoken(parsed)
##D ndoc(parsed)
##D docnames(parsed)
##D 
##D corpus_subset(data_corpus_inaugural, Year <= 1793) %>% spacy_parse()
## End(Not run)



