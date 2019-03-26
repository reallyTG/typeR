library(tcR)


### Name: set.group.vector
### Title: Set group attribute for vertices of a mutation network
### Aliases: set.group.vector get.group.names

### ** Examples

## Not run: 
##D data(twb)
##D twb.shared <- shared.repertoire(twb)
##D G <- mutation.network(twb.shared)
##D G <- set.group.vector(G, "twins", list(A = c(1,2), B = c(3,4)))  # <= refactor this
##D get.group.names(G, "twins", 1)       # "A|B"
##D get.group.names(G, "twins", 300)     # "A"
##D get.group.names(G, "twins", 1, F)    # list(c("A", "B"))
##D get.group.names(G, "twins", 300, F)  # list(c("A"))
##D # Because we have only two groups, we can assign more readable attribute.
##D V(G)$twin.names <- get.group.names(G, "twins")
##D V(G)$twin.names[1]  # "A|B"
##D V(G)$twin.names[300]  # "A"
## End(Not run)



