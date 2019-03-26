library(dagitty)


### Name: ancestorGraph
### Title: Ancestor Graph
### Aliases: ancestorGraph

### ** Examples

g <- dagitty("dag{ z <- x -> y }")
ancestorGraph( g, "z" )

g <- dagitty("pdag{ z -- x -> y }")
ancestorGraph( g, "y" ) # includes z




