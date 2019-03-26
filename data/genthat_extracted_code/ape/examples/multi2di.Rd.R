library(ape)


### Name: multi2di
### Title: Collapse and Resolve Multichotomies
### Aliases: multi2di multi2di.phylo multi2di.multiPhylo di2multi
###   di2multi.phylo di2multi.multiPhylo
### Keywords: manip

### ** Examples

data(bird.families)
is.binary(bird.families)
is.binary(multi2di(bird.families))
all.equal(di2multi(multi2di(bird.families)), bird.families)
### To see the results of randomly resolving a trichotomy:
tr <- read.tree(text = "(a:1,b:1,c:1);")
layout(matrix(1:4, 2, 2))
for (i in 1:4)
  plot(multi2di(tr), use.edge.length = FALSE, cex = 1.5)
layout(1)



