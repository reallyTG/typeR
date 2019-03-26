library(dagitty)


### Name: moralize
### Title: Moral Graph
### Aliases: moralize

### ** Examples

# returns a complete graph
moralize( "dag{ x->m<-y }" )
# also returns a complete graph
moralize( "dag{ x -> m1 <-> m2 <-> m3 <-> m4 <- y }" )




