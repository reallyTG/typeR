library(qgraph)


### Name: pathways
### Title: Highlight shortest pathways in a network
### Aliases: pathways

### ** Examples

library("qgraph")
library("psych")
data(bfi)

# Compute correlations:
CorMat <- cor_auto(bfi[,1:25])

# Compute graph with tuning = 0 (BIC):
BICgraph <- qgraph(CorMat, graph = "glasso", sampleSize = nrow(bfi),
                   tuning = 0, layout = "spring", title = "BIC", details = TRUE)

# All paths between Agreeableness and Neuroticism:
pathways(BICgraph, 
         from = c("A1","A2","A3","A4","A5"), 
         to = c("N1","N2","N3","N4","N5"))




