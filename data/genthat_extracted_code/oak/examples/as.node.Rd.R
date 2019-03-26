library(oak)


### Name: as.node
### Title: Conversion to a node
### Aliases: as.node as.node.character as.node.tree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
as.node(tr2) # the root of 'tr2'

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
## Not run: 
##D as.node(tr3) # generates an error since 'tr3' is unrooted
## End(Not run)




