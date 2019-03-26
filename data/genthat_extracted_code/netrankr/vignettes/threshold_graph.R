## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)
set.seed(1886) #for reproducibility

## ----tg_creation---------------------------------------------------------
 g1 <- threshold_graph(500,0.4)
 g2 <- threshold_graph(500,0.05)
 
 c(round(graph.density(g1),2), round(graph.density(g2),2))

## ----tg_example,fig.show='hold'------------------------------------------
star <- threshold_graph(6,0) 
complete <- threshold_graph(6,1)
plot(star,vertex.label=NA,vertex.color="black")
plot(complete,vertex.label=NA,vertex.color="black")

## ----tg_complete---------------------------------------------------------
g <- threshold_graph(10,0.4)
P <- neighborhood_inclusion(g)
comparable_pairs(P)

## ----tg_cent-------------------------------------------------------------
g <- threshold_graph(100,0.1)

cent.df <- data.frame(
  degree=degree(g),
  betweenness=betweenness(g),
  closeness=closeness(g),
  eigenvector=round(eigen_centrality(g)$vector,8),
  subgraph=subgraph_centrality(g)
)

## ----cor_tg--------------------------------------------------------------
cor.mat <- cor(round(cent.df,8),method="kendall")
cor.mat <- round(cor.mat,2)
cor.mat

## ----compare_ranks-------------------------------------------------------
comp <- compare_ranks(cent.df$degree,cent.df$betweenness)
unlist(comp)

## ----discordant----------------------------------------------------------
dis.pairs <- matrix(0,5,5)
dis.pairs[1,] <- apply(cent.df,2,
                       function(x)compare_ranks(cent.df$degree,x)$discordant)
dis.pairs[2,] <- apply(cent.df,2,
                       function(x)compare_ranks(cent.df$betweenness,x)$discordant)
dis.pairs[3,] <- apply(cent.df,2,
                       function(x)compare_ranks(cent.df$closeness,x)$discordant)
dis.pairs[4,] <- apply(cent.df,2,
                       function(x)compare_ranks(cent.df$eigenvector,x)$discordant)
dis.pairs[5,] <- apply(cent.df,2,
                       function(x)compare_ranks(cent.df$subgraph,x)$discordant)
dis.pairs

## ----major_gap-----------------------------------------------------------
tg <- threshold_graph(200,0.2)
majorization_gap(g)

## ----major_gap_ex_norm---------------------------------------------------

g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
majorization_gap(g)

## ----major_gap_ex_not_norm-----------------------------------------------
majorization_gap(g,norm = FALSE)

