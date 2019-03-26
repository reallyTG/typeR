library(MPSEM)


### Name: GraphFunctions
### Title: Graph creation and manipulation functions
### Aliases: ' graph-functions ' ' pop.graph ' ' add.vertex ' ' rm.vertex '
###   ' add.edge ' ' rm.edge ' ' collapse.vertex ' ' Phylo2DirectedGraph '

### ** Examples

## Populate a graph with 7 vertices labeled A-G having properties x and y:
gr <- pop.graph(n=7,
               vertex=list(x=rnorm(7,0,1),y=rnorm(7,0,1)),
               label=c("A","B","C","D","E","F","G"))
gr
## Adding 3 vertices H, I, and J with property x (y is absent) and a new
## property z (type character), which is unknown for A-G:
gr <- add.vertex(x=gr,
                 n=3,
                 label=c("H","I","J"),
                 vertex=list(x=rnorm(3,0,1),z=c("A","B","C")))
gr
gr$vertex
### Adding 10 edges, labeled E1-E10 and with properties a and b, to the graph:
gr <- add.edge(x=gr,
               from=c("A","B","B","C","C","D","D","E","E","F"),
               to=c("A","C","D","E","F","F","G","H","I","J"),
               edge=list(a=rnorm(10,0,1),b=rnorm(10,0,1)),
               label=paste("E",1:10,sep=""))
gr
gr$edge
### Removing edges 2, 4, and 7 from the graph:
print(rm.edge(gr,id=c(2,4,7)))
### Removing vertices 1, 3, 7, and 10 from the graph:
print(rm.vertex(gr,id=c(1,3,7,10)))
# Notice that the edges that had one of the removed vertex as their
# origin or destination are also removed:
print.default(rm.vertex(gr,id=c(1,3,7,10)))
### Vertex collapsing.
x <- pop.graph(n=9,label=c("A","B","C","D","E","F","G","H","I"))
x <- add.edge(x,from=c("A","A","B","B","C","C","D","D","E","E"),
                to=c("B","C","D","E","E","I","F","G","G","H"),
              label=paste("E",1:10,sep=""),edge=list(length=c(1,2,3,2,1,3,2,2,1,3)))
print.default(x)
for(i in c("A","B","C","D","E","F","G","H","I"))
  print(collapse.vertex(x,id=i))
#
if(require(ape)) {
  tree1 <- read.tree(text=paste("(((A:0.15,B:0.2)N4:0.15,C:0.35)N2:0.25,((D:0.25,E:0.1)N5:0.3,",
                                "(F:0.15,G:0.2)N6:0.3)N3:0.1)N1;",sep=""))
  x <- Phylo2DirectedGraph(tree1)
  print(x)
}



