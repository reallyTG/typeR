library(igraph)


### Name: sample_pa_age
### Title: Generate an evolving random graph with preferential attachment
###   and aging
### Aliases: sample_pa_age aging.prefatt.game aging.barabasi.game
###   aging.ba.game pa_age
### Keywords: graphs

### ** Examples


# The maximum degree for graph with different aging exponents
g1 <- sample_pa_age(10000, pa.exp=1, aging.exp=0, aging.bin=1000)
g2 <- sample_pa_age(10000, pa.exp=1, aging.exp=-1,   aging.bin=1000)
g3 <- sample_pa_age(10000, pa.exp=1, aging.exp=-3,   aging.bin=1000)
max(degree(g1))
max(degree(g2))
max(degree(g3))



