library(oak)


### Name: height
### Title: Height of a tree
### Aliases: height height.rtree height<-

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
tr1 = r_("Dimitri", s = list(c_("Enoc"), c_("Ferdinand")))
tr1 = r_("Caroline", s = list(tr1))
(tr1 = r_("Bill", s = list(tr1)))
(tr2 = r_("Alice", s = list(tr0, tr1)))
height(empty_tree())
height(tr0)
height(tr1)
height(tr2)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
height(tr3)




