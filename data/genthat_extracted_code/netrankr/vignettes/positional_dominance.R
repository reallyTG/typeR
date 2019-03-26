## ----setup, warning=FALSE,message=FALSE----------------------------------
library(netrankr)
library(igraph)
library(magrittr)
set.seed(1886) #for reproducibility

## ----pos_dom-------------------------------------------------------------
g <- graph.empty(n=11,directed = FALSE)
g <- add_edges(g,c(1,11,2,4,3,5,3,11,4,8,5,9,5,11,6,7,6,8,
                   6,10,6,11,7,9,7,10,7,11,8,9,8,10,9,10))
V(g)$name <- 1:11

#neighborhood inclusion can be expressed with the analytic pipeline
D <- g %>% indirect_relations(type="identity") %>% positional_dominance()

#without %>% operator:
# rel <- indirect_relations(g,type="identity")
# D <- positional_dominance(rel)

#check if identical to neighborhood-inclusion
identical(D,neighborhood_inclusion(g))

## ----homo_and_hetero-----------------------------------------------------
D <- g %>% 
  indirect_relations(type="identity") %>% 
  positional_dominance(map=TRUE)

comparable_pairs(D)

## ----dist----------------------------------------------------------------
D1 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=FALSE,benefit=FALSE)

## ----homo_and_hetero_dist------------------------------------------------
D1 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=FALSE,benefit=FALSE)

D2 <- g %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(map=TRUE,benefit=FALSE)

c("heterogeneity"=comparable_pairs(D1),
  "homogeneity"=comparable_pairs(D2))


## ----homo_in_hetero------------------------------------------------------
all(D1!=1 | D2==1) 

