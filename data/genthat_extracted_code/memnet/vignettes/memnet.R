## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(memnet)


## ---- fig.width = 7, fig.height=5, warning = FALSE-----------------------
library(memnet)

# get data
data("animal_fluency")
age = as.numeric(names(animal_fluency))

# infer networks for age > 70
net_comunity = community_graph(animal_fluency[age > 70])
net_threshold = threshold_graph(animal_fluency[age > 70])
net_rw = rw_graph(animal_fluency[age > 70])

# show stats
network_stats(edg_to_adj(net_comunity))
network_stats(edg_to_adj(net_threshold))
network_stats(edg_to_adj(net_rw))

# plot
network_plot(edg_to_adj(net_comunity), nod_cex = 2, lab_cex = 1)
network_plot(edg_to_adj(net_threshold), nod_cex = 2, lab_cex = 1)
network_plot(edg_to_adj(net_rw), nod_cex = 2, lab_cex = .5, lab_lwd = 1, lab_grid_size = 70)

# inspect neighborhood of cat 
neighborhood_plot(edg_to_adj(net_comunity), k = 3, node = 'cat', nod_cex = 2, lab_cex = 1)
neighborhood_plot(edg_to_adj(net_threshold), k = 3, node = 'cat', nod_cex = 2, lab_cex = 1)
neighborhood_plot(edg_to_adj(net_rw), k = 3, node = 'cat', nod_cex = 2, lab_cex = 1)


## ---- fig.width = 7, fig.height=5, warning = FALSE-----------------------

# plot networks of different growth mechanisms
network_plot(grow_st(20, 2))
network_plot(grow_hk(20, 2, p = .3))
network_plot(grow_ba(20, 2))
network_plot(grow_ws(20, 4, p = .5))
network_plot(grow_ws(20, 4))


## ---- fig.width = 7, fig.height=5, warning = FALSE-----------------------

# extract adjlist from community network
adjlist = edg_to_adjlist(net_comunity) 

# simulate fluency sequences
f = fluency(adjlist, c(10, 14, 16, 18))
restore_names(f, get_names(net_comunity))

# simulate fluency sequences
s = search_rw_mean(adjlist, 1:5, 1:5, nrep = 100)
restore_names(s, get_names(net_comunity))

