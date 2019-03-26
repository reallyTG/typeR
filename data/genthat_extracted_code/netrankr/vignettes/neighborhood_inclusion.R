## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)
set.seed(1886) #for reproducibility

## ----simple_graph, fig.align='center', fig.width=3-----------------------
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
V(g)$name <- 1:11

plot(g,
     vertex.color="black",vertex.label.color="white", vertex.size=16,vertex.label.cex=0.75,
     edge.color="black",
     margin=0,asp=0.5)

## ----neighborhood--------------------------------------------------------
u <- 3
v <- 5
Nu <- neighborhood(g,order=1,nodes=u,mindist = 1)[[1]] #N(u) 
Nv <- neighborhood(g,order=1,nodes=v,mindist = 0)[[1]] #N[v] 

Nu
Nv

## ----inclusion-----------------------------------------------------------
all(Nu%in%Nv)

## ----neighborhood_inclusion----------------------------------------------
P <- neighborhood_inclusion(g)
P

## ----dominance_graph,fig.align='center',fig.width=5----------------------
g.dom <- dominance_graph(P)

plot(g.dom,
     vertex.color="black",vertex.label.color="white", vertex.size=16, vertex.label.cex=0.75,
     edge.color="black", edge.arrow.size=0.5,margin=0,asp=0.5)

## ----indices-------------------------------------------------------------
cent.df <- data.frame(
  vertex=1:11,
  degree=degree(g),
  betweenness=betweenness(g),
  closeness=closeness(g),
  eigenvector=eigen_centrality(g)$vector,
  subgraph=subgraph_centrality(g)
)

#rounding for better readability
cent.df.rounded <- round(cent.df,4) 
cent.df.rounded

## ----undominated---------------------------------------------------------
which(rowSums(P)==0)

## ----rank_preserved------------------------------------------------------
apply(cent.df[,2:6],2,function(x) is_preserved(P,x))

