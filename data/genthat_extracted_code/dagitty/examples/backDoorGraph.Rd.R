library(dagitty)


### Name: backDoorGraph
### Title: Back-Door Graph
### Aliases: backDoorGraph

### ** Examples

g <- dagitty( "dag { x <-> m <-> y <- x }" )
backDoorGraph( g ) # x->y edge is removed

g <- dagitty( "mag { x <-> m <-> y <- x }" )
backDoorGraph( g ) # x->y edge is not removed

g <- dagitty( "mag { x <-> m <-> y <- x <- i }" )
backDoorGraph( g ) # x->y edge is removed




