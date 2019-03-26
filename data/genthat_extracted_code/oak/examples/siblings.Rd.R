library(oak)


### Name: siblings
### Title: Siblings of a node
### Aliases: siblings siblings.rtree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
siblings("Bob", tr2)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
siblings("Alice", tr3) # note that in 'tr3', Alice and Grand-Mother are not siblings




