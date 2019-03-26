library(oak)


### Name: tree_apply
### Title: Apply a function to each node of a tree
### Aliases: tree_apply tree_apply.rtree

### ** Examples

## Rooted tree
(tr0 = c_("Bob", "Carl", "Daniel"))
(tr1 = c_("Bill", "Caroline", "Dimitri", "Enoc"))
(tr2 = r_("Alice", s = list(tr0, tr1)))

## Unrooted tree
(tr3 = r_(s = list(tr2, c_("Grand-Mother", "Father", "Son"))))

f <- function(.node, .tree) nchar(label(.node))
tr4 = tree_apply(tr3, at = "value", fun = f)
print(tr4, at = "value")

g <- function(.node, .tree) height(take_branch(.tree, .node))
tr5 = tree_apply(tr3, at = "height", fun = g)
print(tr5, at = "height")




