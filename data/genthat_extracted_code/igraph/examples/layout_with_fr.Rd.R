library(igraph)


### Name: layout_with_fr
### Title: The Fruchterman-Reingold layout algorithm
### Aliases: layout_with_fr with_fr
### Keywords: graphs

### ** Examples


# Fixing ego
g <- sample_pa(20, m=2)
minC <- rep(-Inf, vcount(g))
maxC <- rep(Inf, vcount(g))
minC[1] <- maxC[1] <- 0
co <- layout_with_fr(g, minx=minC, maxx=maxC,
                                  miny=minC, maxy=maxC)
co[1,]
plot(g, layout=co, vertex.size=30, edge.arrow.size=0.2,
     vertex.label=c("ego", rep("", vcount(g)-1)), rescale=FALSE,
     xlim=range(co[,1]), ylim=range(co[,2]), vertex.label.dist=0,
     vertex.label.color="red")
axis(1)
axis(2)




