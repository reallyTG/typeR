library(ape)


### Name: boot.phylo
### Title: Tree Bipartition and Bootstrapping Phylogenies
### Aliases: boot.phylo prop.part prop.clades print.prop.part
###   summary.prop.part plot.prop.part
### Keywords: manip htest

### ** Examples

data(woodmouse)
f <- function(x) nj(dist.dna(x))
tr <- f(woodmouse)
### Are bootstrap values stable?
for (i in 1:5)
  print(boot.phylo(tr, woodmouse, f, quiet = TRUE))
### How many partitions in 100 random trees of 10 labels?...
TR <- rmtree(100, 10)
pp10 <- prop.part(TR)
length(pp10)
### ... and in 100 random trees of 20 labels?
TR <- rmtree(100, 20)
pp20 <- prop.part(TR)
length(pp20)
plot(pp10, pch = "x", col = 2)
plot(pp20, pch = "x", col = 2)

set.seed(1)
tr <- rtree(10) # rooted
## the following used to return a wrong result with ape <= 3.4:
prop.clades(tr, tr)
prop.clades(tr, tr, rooted = TRUE)
tr <- rtree(10, rooted = FALSE)
prop.clades(tr, tr) # correct

### an illustration of the use of prop.clades with bootstrap trees:

fun <- function(x) as.phylo(hclust(dist.dna(x), "average")) # upgma() in phangorn
tree <- fun(woodmouse)
## get 100 bootstrap trees:
bstrees <- boot.phylo(tree, woodmouse, fun, trees = TRUE)$trees
## get proportions of each clade:
clad <- prop.clades(tree, bstrees, rooted = TRUE)
## get proportions of each bipartition:
boot <- prop.clades(tree, bstrees)
layout(1)
par(mar = rep(2, 4))
plot(tree, main = "Bipartition vs. Clade Support Values")
drawSupportOnEdges(boot)
nodelabels(clad)
legend("bottomleft", legend = c("Bipartitions", "Clades"), pch = 22,
       pt.bg = c("green", "lightblue"), pt.cex = 2.5)

## Not run: 
##D ## an example of double bootstrap:
##D nrep1 <- 100
##D nrep2 <- 100
##D p <- ncol(woodmouse)
##D DB <- 0
##D 
##D for (b in 1:nrep1) {
##D     X <- woodmouse[, sample(p, p, TRUE)]
##D     DB <- DB + boot.phylo(tr, X, f, nrep2, quiet = TRUE)
##D }
##D DB
##D ## to compare with:
##D boot.phylo(tr, woodmouse, f, 1e4)
## End(Not run)



