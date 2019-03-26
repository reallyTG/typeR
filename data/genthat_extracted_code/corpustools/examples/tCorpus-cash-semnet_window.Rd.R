library(corpustools)


### Name: tCorpus$semnet_window
### Title: Create a semantic network based on the co-occurence of tokens in
###   token windows
### Aliases: tCorpus$semnet_window semnet_window

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)

g = tc$semnet_window('token', window.size = 1)
g
igraph::get.data.frame(g)
## Not run: plot_semnet(g)



