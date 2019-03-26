library(oak)


### Name: flatten
### Title: Flatten a tree
### Aliases: flatten flatten.rtree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
flatten(tr2)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
flatten(tr3)




