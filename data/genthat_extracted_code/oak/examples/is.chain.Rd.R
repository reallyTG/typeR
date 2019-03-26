library(oak)


### Name: is.chain
### Title: Test if a tree is a chain
### Aliases: is.chain is.chain.rtree

### ** Examples

## FALSE
is.chain(empty_tree())

## TRUE
(tr0 = c_("Bob", "Carl", "Daniel"))
is.chain(tr0)

## FALSE
(tr1 = r_(s = list(tr0)))
is.chain(tr1)

## FALSE
(tr = r_("titi", s = list(r_("toto"), r_("tata"))))
is.chain(tr)




