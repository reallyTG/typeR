library(corpustools)


### Name: backbone_filter
### Title: Extract the backbone of a network.
### Aliases: backbone_filter

### ** Examples

## Not run: 
##D tc = create_tcorpus(sotu_texts, doc_column = 'id')
##D tc$preprocess('token','feature', remove_stopwords = TRUE, use_stemming = TRUE, min_docfreq = 10)
##D 
##D g = tc$semnet_window('feature', window.size = 10)
##D igraph::vcount(g)
##D igraph::ecount(g)
##D gb = backbone_filter(g, max_vertices = 100)
##D igraph::vcount(gb)
##D igraph::ecount(gb)
##D plot_semnet(gb)
## End(Not run)



