library(ape)


### Name: speciesTree
### Title: Species Tree Estimation
### Aliases: speciesTree
### Keywords: models

### ** Examples

### example in Liu et al. (2010):
tr1 <- read.tree(text = "(((B:0.05,C:0.05):0.01,D:0.06):0.04,A:0.1);")
tr2 <- read.tree(text = "(((A:0.07,C:0.07):0.02,D:0.09):0.03,B:0.12);")
TR <- c(tr1, tr2)
TSmax <- speciesTree(TR) # MAXTREE
TSsha <- speciesTree(TR, mean) # shallowest divergence

kronoviz(c(tr1, tr2, TSmax, TSsha), horiz = FALSE,
         type = "c", cex = 1.5, font = 1)
mtext(c("Gene tree 1", "Gene tree 2", "Species tree - MAXTREE"),
      at = -c(7.5, 4, 1))
mtext("Species tree - Shallowest Divergence")
layout(1)



