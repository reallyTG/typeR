library(oak)


### Name: label
### Title: Labels of nodes and trees
### Aliases: label label<- labels.rtree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
labels(tr0)
labels(tr1)
labels(tr2)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
labels(tr3)




