library(kangar00)


### Name: pathway
### Title: An S4 class to represent a gene-gene interaction network
### Aliases: pathway pathway,ANY-method show,pathway-method
###   show,pathway,ANY-method summary,pathway-method
###   summary,pathway,ANY-method pathway2igraph,pathway-method
###   pathway2igraph ANY-method analyze,pathway-method analyze
###   get_genes,pathway-method get_genes plot,pathway,missing-method
###   plot,pathway,ANY-method sample_genes,pathway-method sample_genes

### ** Examples

# pathway object constructor
pathway(id="hsa04022")

# convert to igraph object
data(hsa04020)
str(hsa04020)
g <- pathway2igraph(hsa04020)
str(g)

# analyze pathway network properties
data(hsa04020)
summary(hsa04020)
analyze(hsa04020)

# extract gene names from pathway object
get_genes(hsa04020)

# plot pathway as igraph object
plot(hsa04020)
sample3 <- sample_genes(hsa04020, no = 3)
plot(hsa04020, highlight.genes = sample3)

# sample effect genes
sample3 <- sample_genes(hsa04020, no = 3)
plot(hsa04020, highlight.genes = sample3)
sample5 <- sample_genes(hsa04020, no = 5)
plot(hsa04020, highlight.genes = sample5)




