library(ergm)


### Name: search.ergmTerms
### Title: Search the ergm-terms documentation for appropriate terms
### Aliases: search.ergmTerms

### ** Examples


# find all of the terms that mention triangles
search.ergmTerms('triangle')

# two ways to search for bipartite terms:

# search using a bipartite net as a template
myNet<-network.initialize(5,bipartite=3)
search.ergmTerms(net=myNet)

# or request the bipartite category
search.ergmTerms(categories='bipartite')

# search on multiple categories
search.ergmTerms(categories=c('bipartite','dyad-independent'))

# print out the content for a specific term
search.ergmTerms(name='b2factor')




