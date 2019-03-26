library(sdmpredictors)


### Name: dataset_citations
### Title: Generate dataset citations
### Aliases: dataset_citations

### ** Examples

# print the Bio-ORACLE citation
print(dataset_citations("Bio-ORACLE"))

# print all citations as Bibtex
print(lapply(dataset_citations(astext = FALSE), toBibtex))



