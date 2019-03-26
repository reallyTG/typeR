library(interventionalDBN)


### Name: nxt
### Title: Produces the next set of parents from an existing set of parents
###   (internal).
### Aliases: nxt

### ** Examples

g<-rep(0,7)
for (i in 1:countGraphs(7,3)) {
  cat(g,"\n")
  g<-nxt(g,3)
}



