library(igraph)


### Name: sample_forestfire
### Title: Forest Fire Network Model
### Aliases: sample_forestfire forest.fire.game
### Keywords: graphs

### ** Examples


g <- sample_forestfire(10000, fw.prob=0.37, bw.factor=0.32/0.37)
dd1 <- degree_distribution(g, mode="in")
dd2 <- degree_distribution(g, mode="out")
plot(seq(along=dd1)-1, dd1, log="xy")
points(seq(along=dd2)-1, dd2, col=2, pch=2)



