library(corpustools)


### Name: plot.vocabularyComparison
### Title: visualize vocabularyComparison
### Aliases: plot.vocabularyComparison

### ** Examples

## as example, compare SOTU paragraphs about taxes to rest
tc = create_tcorpus(sotu_texts[1:100,], doc_column = 'id')
comp = tc$compare_subset('token', query_x = 'tax*')

## Not run: 
##D plot(comp, balance=T)
##D plot(comp, mode = 'ratio_x')
##D plot(comp, mode = 'ratio_y')
## End(Not run)



