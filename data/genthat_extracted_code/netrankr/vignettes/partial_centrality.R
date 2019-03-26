## ----global_options, include=FALSE---------------------------------------
knitr::opts_chunk$set(fig.width=5,fig.align = 'center')

## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)
library(magrittr)

## ----pos_dom-------------------------------------------------------------
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
V(g)$name <- LETTERS[1:11]

#neighborhood inclusion 
P <- g %>% neighborhood_inclusion()

#without %>% operator:
# P <- neighborhood_inclusion(g)

rank_intervals(P)

## ----vis_intervals_cent--------------------------------------------------

cent_scores <- data.frame(
   degree=degree(g),
   betweenness=round(betweenness(g),4),
   closeness=round(closeness(g),4),
   eigenvector=round(eigen_centrality(g)$vector,4))

plot_rank_intervals(P,cent.df = cent_scores)

## ----tg_ri---------------------------------------------------------------
set.seed(123)
tg <- threshold_graph(20,0.2)

#neighborhood inclusion 
P <- tg %>% neighborhood_inclusion()

#without %>% operator:
# P <- neighborhood_inclusion(tg)
plot_rank_intervals(P)

## ----tg_ri_cent----------------------------------------------------------
cent_scores <- data.frame(
   degree=degree(tg),
   betweenness=round(betweenness(tg),4),
   closeness=round(closeness(tg),4),
   eigenvector=round(eigen_centrality(tg)$vector,4))


plot_rank_intervals(P,cent.df=cent_scores)

