library(isa2)


### Name: isa.sweep
### Title: Create a hierarchical structure of ISA biclusters
### Aliases: isa.sweep isa.sweep,matrix-method sweep.graph
###   sweep.graph,list-method
### Keywords: cluster

### ** Examples

## In-silico data
set.seed(1)
insili <- isa.in.silico()

## Do ISA with a bunch of row thresholds while keeping the column
## threshold fixed. This is quite an artificial example...
isares <- isa(insili[[1]], thr.row=c(0.5,1,2), thr.col=0)

## Create a nice tree from the modules, we need the normed data for this
nm <- isa.normalize(insili[[1]])
isa.tree <- isa.sweep(insili[[1]], nm, isares)
network <- sweep.graph(isa.tree)

## Plot the network of modules, only if the igraph package is
## installed
if (interactive() && require(igraph) &&
    compareVersion(packageDescription("igraph")$Version, "0.6")>=0) {
  lab <- paste(sep="", seq_len(ncol(isa.tree$rows)), ": ",
               colSums(isa.tree$rows!=0), ",",
               colSums(isa.tree$columns!=0))
  par(mar=c(1,1,1,1))
  roots <- tapply(topological.sort(network, mode="out"),
                  clusters(network)$membership, function(x) x[1])
  rootlevel <- isa.tree$seeddata$level-1
  coords <- layout.reingold.tilford(network, root=roots,
                                    rootlevel=rootlevel[roots+1])
  plot(network, layout=coords,
       vertex.shape="rectangle", vertex.color="green",
       vertex.label=lab, vertex.size=30, vertex.size2=10)
}

## Plot the modules themselves as well
if (interactive()) {
  plotModules(isa.tree)
}

## Yet another plot, the scores for the rows within the modules
if (interactive()) {
  layout(matrix( 1:15, ncol=3 ))
  for (i in seq(ncol(isa.tree$rows))) {
    par(mar=c(2,2,1,1))
    plot(isa.tree$rows[,i], axes=FALSE, ylim=c(-1,1))
    axis(1); axis(2)
    text(nrow(isa.tree$rows), 1, adj=c(1,1), paste(sep="", "#", i), cex=2)
  }
}
    



