library(treemap)


### Name: treegraph
### Title: Create a tree graph
### Aliases: treegraph

### ** Examples

data(business)
treegraph(business, index=c("NACE1", "NACE2", "NACE3", "NACE4"), show.labels=FALSE)
treegraph(business[business$NACE1=="F - Construction",], 
    index=c("NACE2", "NACE3", "NACE4"), show.labels=TRUE, truncate.labels=c(2,4,6))
treegraph(business[business$NACE1=="F - Construction",], 
    index=c("NACE2", "NACE3", "NACE4"), show.labels=TRUE, truncate.labels=c(2,4,6),
    vertex.layout="fruchterman.reingold")



