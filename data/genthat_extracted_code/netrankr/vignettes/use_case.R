## ----libs, warning=FALSE,message=FALSE-----------------------------------
library(igraph)
library(netrankr)
library(magrittr)
library(ggplot2)

## ----plot,fig.height=5,fig.width=5,fig.align='center'--------------------
data("florentine_m")
#Delete Pucci family (isolated)
florentine_m <- delete_vertices(florentine_m,which(degree(florentine_m)==0))

#plot the graph (label size proportional to wealth)
set.seed(111)
plot(florentine_m,
     vertex.label.cex=V(florentine_m)$wealth*0.01, 
     vertex.label.color="black",
     vertex.color="white",
     vertex.frame.color="gray")

## ----cent----------------------------------------------------------------
cent.df <- data.frame(
  degree = degree(florentine_m),
  betweenness = betweenness(florentine_m),
  closeness = closeness(florentine_m),
  eigenvector = eigen_centrality(florentine_m)$vector,
  subgraph = subgraph_centrality(florentine_m))

# most central family according to the 5 indices
V(florentine_m)$name[apply(cent.df,2,which.max)]

## ----cent_new------------------------------------------------------------
#odd subgraph centrality
sc_odd <- florentine_m %>% 
  indirect_relations(type = "walks",FUN = walks_exp_odd) %>% 
  aggregate_positions(type = "self")

#family with highest score 
V(florentine_m)$name[which.max(sc_odd)]

## ----ni------------------------------------------------------------------
P <- neighborhood_inclusion(florentine_m)

## ----ni_comp-------------------------------------------------------------
comparable_pairs(P)

## ----dom_graph,fig.height=5,fig.width=5,fig.align='center'---------------
d <- dominance_graph(P)
V(d)$name <- V(florentine_m)$name
set.seed(113)
plot(d,vertex.label.color="black",
     vertex.color="white",
     vertex.frame.color="gray",
     edge.arrow.size=0.5)

## ----rk_inter,fig.align='center',fig.width=5,fig.height=5----------------
plot_rank_intervals(P)

## ----probs---------------------------------------------------------------
res <- exact_rank_prob(P)


## ----likely_most_central-------------------------------------------------
top_rank_prob <- res$rank.prob[,15]
names(top_rank_prob) <- V(florentine_m)$name
round(top_rank_prob[top_rank_prob>0.1],3)

## ----medici_strozzi,eval=TRUE--------------------------------------------
id_strozzi <- which(V(florentine_m)$name=="Strozzi") 
id_medici  <- which(V(florentine_m)$name=="Medici")
res$relative.rank[id_strozzi,id_medici]

## ----exp_rank,echo=FALSE-------------------------------------------------
tab <- data.frame(Name=V(florentine_m)$name,Expected=round(res$expected.rank,2))
tab <- tab[order(tab[,2],decreasing=TRUE),]
knitr::kable(tab,row.names = F)

## ----closeness_vs_wealth-------------------------------------------------

#Closeness
c_C <- florentine_m %>% 
  indirect_relations(type="dist_sp") %>% 
  aggregate_positions(type="invsum")

cor(c_C,V(florentine_m)$wealth,method="kendall")

## ----harmclos_wealth-----------------------------------------------------
#harmonic closeness
c_HC <- florentine_m %>% 
  indirect_relations(type="dist_sp",FUN=dist_inv) %>% 
  aggregate_positions(type="sum")
#residual closeness (Dangalchev,2006)
c_RC <- florentine_m %>% 
  indirect_relations(type="dist_sp",FUN=dist_2pow) %>% 
  aggregate_positions(type="sum")

#integration centrality (Valente & Foreman, 1998)
dist_integration <- function(x){
  x <- 1 - (x - 1)/max(x)
}
c_IN <- florentine_m %>% 
  indirect_relations(type="dist_sp",FUN=dist_integration) %>% 
  aggregate_positions(type="sum")

c(cor(c_HC,V(florentine_m)$wealth,method="kendall"),
cor(c_RC,V(florentine_m)$wealth,method="kendall"),
cor(c_IN,V(florentine_m)$wealth,method="kendall")
)

## ----distalpha_wealth,warning=FALSE--------------------------------------
#generalized closeness (Agneessens et al.,2017) (alpha>0) sum(dist^-alpha)
alpha <- c(seq(0.01,0.99,0.01),seq(1,10,0.1))
scores <- 
sapply(alpha,function(x)
    florentine_m %>% 
      indirect_relations(type="dist_sp",FUN=dist_dpow,alpha=x) %>% 
      aggregate_positions(type="sum")
)
cors_gc <- apply(scores,2,
              function(x)cor(x,V(florentine_m)$wealth,method="kendall"))

res_gc <- c(max(cors_gc),alpha[which.max(cors_gc)])

#decay centrality (Jackson, 2010) (alpha in [0,1]) sum(alpha^dist)
alpha <- seq(0.01,0.99,0.01)
scores <- 
sapply(alpha,function(x)
  florentine_m %>% 
    indirect_relations(type="dist_sp",FUN=dist_powd,alpha=x) %>% 
    aggregate_positions(type="sum")
)
cors_dc <- apply(scores,2,
              function(x)cor(x,V(florentine_m)$wealth,method="kendall"))

res_dc <- c(max(cors_dc),alpha[which.max(cors_dc)])

## ----pos_dom_hetero------------------------------------------------------
D <- florentine_m %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(benefit=F)

comparable_pairs(D)

## ----pos_dom_homo--------------------------------------------------------
D <- florentine_m %>% 
  indirect_relations(type="dist_sp") %>% 
  positional_dominance(benefit=F,map=T)

comparable_pairs(D)

## ----plot dist_dom,fig.align="center",fig.height=5,fig.width=5,echo=F----
d <- dominance_graph(D)
V(d)$name <- V(florentine_m)$name
x <- V(florentine_m)$wealth
x[9] <- x[9]-50
x[14] <- x[14]-50
y <- colSums(D)
el <- get.edgelist(d,names = F)
E(d)$color <- "gray"
col <- apply(el,1,function(x)V(florentine_m)$wealth[x[1]]>V(florentine_m)$wealth[x[2]])
#wrong:41
E(d)$color[col] <- "indianred"

plot(d,layout=cbind(x,y),
     vertex.label.cex=0.75,
     vertex.label.color="black",
     vertex.color="white",
     vertex.frame.color="gray",
     edge.arrow.size=0.4
     )

## ----rk_inter_dist,fig.align='center',fig.width=5,fig.height=5-----------
plot_rank_intervals(D)

## ----dist_probs----------------------------------------------------------
res <- exact_rank_prob(D)

## ----dist_probs_lat------------------------------------------------------
res <- exact_rank_prob(D,only.results = FALSE)

## ----all_rankings--------------------------------------------------------
all_ranks <- get_rankings(res)
dim(all_ranks)

## ----all_cors------------------------------------------------------------
dist_cor <- apply(all_ranks,2,
              function(x)cor(V(florentine_m)$wealth,x,method="kendall"))
c(max_cor = max(dist_cor),mean_cor = mean(dist_cor))

## ----vis_rank_cor,fig.align='center',fig.width=5,fig.height=5,echo=FALSE----
dist_cor<-
data.frame(cor = apply(all_ranks,2,
           function(x)cor(V(florentine_m)$wealth,x,method="kendall")),
           method = "distance")

ggplot(dist_cor)+
  geom_boxplot(aes(x=method,y=cor))+
  theme(text = element_text(family="Times",size=14),
        panel.border = element_blank(),
        panel.background = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank())+
      labs(x="",y="Correlation with wealth")


## ----cor_deg-------------------------------------------------------------
cor(degree(florentine_m),V(florentine_m)$wealth,method="kendall")

