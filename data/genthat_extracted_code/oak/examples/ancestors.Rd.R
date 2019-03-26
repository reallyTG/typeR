library(oak)


### Name: ancestors
### Title: Ancestors of a node
### Aliases: ancestors ancestors.rtree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
ancestors("Alice", tr2)
ancestors("Daniel", tr2, include_node = TRUE)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
ancestors("Alice", tr3)
ancestors("Alice", tr3, include_node = TRUE)
ancestors("Daniel", tr3)
ancestors("Son", tr3)
ancestors("Son", tr3, include_node = TRUE)




