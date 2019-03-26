library(ade4)


### Name: phylog
### Title: Phylogeny
### Aliases: phylog print.phylog phylog.extract phylog.permut
### Keywords: manip

### ** Examples

marthans.tre <- NULL
marthans.tre[1] <-"((((1:4,2:4)a:5,(3:7,4:7)b:2)c:2,5:11)d:2,"
marthans.tre[2] <- "((6:5,7:5)e:4,(8:4,9:4)f:5)g:4);"
marthans.phylog <- newick2phylog(marthans.tre)
marthans.phylog

if(requireNamespace("ape", quietly = TRUE)) {
  marthans.phylo <- ape::read.tree(text = marthans.tre)
  marthans.phylo

  par(mfrow = c(1, 2))
  plot(marthans.phylog, cnode = 3, f = 0.8, cle = 3)
  plot(marthans.phylo)
  par(mfrow = c(1, 1))
}



