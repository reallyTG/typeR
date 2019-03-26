library(corpustools)


### Name: tCorpus$semnet
### Title: Create a semantic network based on the co-occurence of tokens in
###   documents
### Aliases: tCorpus$semnet semnet

### ** Examples

text = c('A B C', 'D E F. G H I', 'A D', 'GGG')
tc = create_tcorpus(text, doc_id = c('a','b','c','d'), split_sentences = TRUE)

g = tc$semnet('token')
g
igraph::get.data.frame(g)
## Not run: plot_semnet(g)



