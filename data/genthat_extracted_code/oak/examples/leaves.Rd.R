library(oak)


### Name: leaves
### Title: Leaves of a tree
### Aliases: leaves leaves.rtree is_leafnode

### ** Examples

## Chains
(tr0 = c_("Bob", "Carl", "Daniel"))
leaves(tr0)
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
leaves(tr1)

## Rooted tree
(tr2 = r_("Alice", s = list(tr0, tr1)))
leaves(tr2)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
leaves(tr3)




