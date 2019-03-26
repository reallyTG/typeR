library(corpustools)


### Name: plot_semnet
### Title: Visualize a semnet network
### Aliases: plot_semnet

### ** Examples

tc = create_tcorpus(sotu_texts, doc_column = 'id')
tc$preprocess('token','feature', remove_stopwords = TRUE, use_stemming = TRUE, min_docfreq=10)
## Not run: 
##D g = tc$semnet_window('feature', window.size = 10)
##D g = backbone_filter(g, max_vertices = 100)
##D plot_semnet(g)
## End(Not run)



