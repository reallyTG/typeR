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

cent_scores <- data.frame(
   degree=degree(g),
   betweenness=round(betweenness(g),4),
   closeness=round(closeness(g),4),
   eigenvector=round(eigen_centrality(g)$vector,4),
   subgraph=round(subgraph_centrality(g),4))

plot_rank_intervals(P,cent.df = cent_scores)

## ----calc_probs----------------------------------------------------------
res <- exact_rank_prob(P)
str(res)

## ----rk_probs------------------------------------------------------------
rp <- round(res$rank.prob,2)
rp

## ----rk_top--------------------------------------------------------------
rp[,11]

## ----rrp-----------------------------------------------------------------
rrp <- round(res$relative.rank,2)
rrp

## ----rk_exp--------------------------------------------------------------
ex_rk <- round(res$expected.rank,2)
ex_rk

