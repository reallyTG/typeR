library(oak)


### Name: rtree
### Title: Tree constructor
### Aliases: rtree r_ empty_tree is.empty.rtree

### ** Examples

## Chains
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))

## Rooted tree
(tr2 = r_("Alice", s = list(tr0, tr1)))

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
             



