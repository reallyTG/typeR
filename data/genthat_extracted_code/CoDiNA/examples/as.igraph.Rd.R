library(CoDiNA)


### Name: as.igraph
### Title: as.igraph
### Aliases: as.igraph

### ** Examples

Nodes = LETTERS[1:10]
Net1 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
Net2 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
Net3 = data.frame(Node.1 = sample(Nodes) , Node.2 = sample(Nodes), wTO = runif(10,-1,1))
DiffNet = MakeDiffNet (Data = list(Net1,Net2,Net3), Code = c('Net1', 'Net2', 'Net3') )
Graph = plot(x = DiffNet,
 layout = NULL, smooth.edges = TRUE,
 path = NULL, MakeGroups = FALSE, Cluster = FALSE,
 legend = TRUE, manipulation = FALSE, sort.by.Phi = FALSE)
x = as.igraph(Graph)

plot(x)




