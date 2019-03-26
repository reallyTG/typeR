library(nFCA)


### Name: nfca
### Title: Numerical Formal Concept Analysis for Systematic Clustering
### Aliases: nfca

### ** Examples

# View a build-in correlation matrix: nfca_example
data("nfca_example", package = "nFCA")
nfca_example
     
# 1. using the default 'histogram' method and choosing threshold
# automatically   
nfca(data = nfca_example)

# 2. using 'confidence interval' method with sample size 30 and 
# choosing threshold automatically 
nfca(data = nfca_example, method = "CI")

# The output files Hgraph.dot and Igraph.dot from #1 and #2 can
# be visualized as H- and I-graphs in Graphviz. In this example,
# the I-graphs from both 'histogram' and 'confidence interval' 
# methods are identical, while two H-graphs are consistent to
# each other.



