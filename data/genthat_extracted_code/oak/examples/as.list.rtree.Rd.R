library(oak)


### Name: as.list.rtree
### Title: Conversion of a tree to a list
### Aliases: as.list.rtree

### ** Examples

(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))
as.list(tr2)
as.list(tr2, rec = TRUE)

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))
as.list(tr3)
as.list(tr3, rec = TRUE)




