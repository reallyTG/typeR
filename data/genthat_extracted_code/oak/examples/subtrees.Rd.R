library(oak)


### Name: subtrees
### Title: Subtrees of a tree
### Aliases: subtrees subtrees.rtree subtrees<-

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
(subtrees(tr2))

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Son", "Father", "Grand-Mother"))))
(subtrees(tr3))




