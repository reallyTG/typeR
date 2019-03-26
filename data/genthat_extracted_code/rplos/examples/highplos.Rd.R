library(rplos)


### Name: highplos
### Title: Do highlighted searches on PLOS Journals full-text content
### Aliases: highplos

### ** Examples

## Not run: 
##D highplos(q='alcohol', hl.fl = 'abstract', rows=10)
##D highplos(q='alcohol', hl.fl = c('abstract','title'), rows=10)
##D highplos(q='everything:"sports alcohol"~7', hl.fl='everything')
##D highplos(q='alcohol', hl.fl='abstract', hl.fragsize=20, rows=5)
##D highplos(q='alcohol', hl.fl='abstract', hl.snippets=5, rows=5)
##D highplos(q='alcohol', hl.fl='abstract', hl.snippets=5,
##D   hl.mergeContiguous='true', rows=5)
##D highplos(q='alcohol', hl.fl='abstract', hl.useFastVectorHighlighter='true',
##D   rows=5)
##D highplos(q='everything:"experiment"', fq='doc_type:full', rows=100,
##D   hl.fl = 'title')
## End(Not run)



