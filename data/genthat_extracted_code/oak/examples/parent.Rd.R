library(oak)


### Name: parent
### Title: Parent of a node
### Aliases: parent parent.rtree has.parent

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Son", "Father", "Grand-Mother"))))
parent("Alice", tr3)
parent("Bob", tr3)
parent("any node", tr3)




