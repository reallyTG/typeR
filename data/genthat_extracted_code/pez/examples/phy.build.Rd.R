library(pez)


### Name: phy.build
### Title: Build a novel phylogeny from existing data (based on
###   phyloGenerator)
### Aliases: bind.replace congeneric.merge phy.build

### ** Examples

tree <- read.tree(text="((a_a:1,b_b:1):1, c_c:2):1;")
tree <- congeneric.merge(tree, c("a_nother", "a_gain", "b_sharp"))



