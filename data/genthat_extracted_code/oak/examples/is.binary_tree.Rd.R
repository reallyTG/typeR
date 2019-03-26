library(oak)


### Name: is.binary_tree
### Title: Test if a tree is a binary tree
### Aliases: is.binary_tree

### ** Examples

## FALSE
is.binary_tree(empty_tree())

## FALSE
tr = r_(s = list(r_("toto"), r_("tata")))
is.binary_tree(tr) # unrooted tree

## TRUE
tr = r_("titi", s = list(r_("toto"), r_("tata")))
is.binary_tree(tr)




