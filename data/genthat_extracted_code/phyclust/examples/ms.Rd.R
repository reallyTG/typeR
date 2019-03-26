library(phyclust)


### Name: ms
### Title: Generating Samples under a Wright-Fisher Neutral Model of
###   Genetic Variation
### Aliases: ms 'Class ms'
### Keywords: ms

### ** Examples

## Not run: 
##D library(phyclust, quiet = TRUE)
##D 
##D ms()
##D 
##D # an ancestral tree
##D set.seed(1234)
##D (ret.ms <- ms(nsam = 3, opts = "-T -G 0.1"))
##D (tree.anc <- read.tree(text = ret.ms[3]))
##D tree.anc$tip.label <- paste("a", 1:K, sep = "")
##D 
##D # adjacent descendant trees to the ancestral tree
##D K <- 3
##D N <- 12
##D N.k <- c(3, 4, 5)
##D ms.dec <- NULL         # a list to store trees of ms
##D tree.dec <- NULL       # a list to store the trees in phylo class
##D tree.joint <- tree.anc
##D for(k in 1:K){
##D   ms.dec[[k]] <- ms(N.k[k], opts = "-T -G 1.0")
##D   tree.dec[[k]] <- read.tree(text = ms.dec[[k]][3])
##D   tree.dec[[k]]$tip.label <- paste("d", k, ".", 1:N.k[k], sep = "")
##D   tree.joint <- bind.tree(tree.joint, tree.dec[[k]],
##D                           where = which(tree.joint$tip.label ==
##D                                         paste("a", k, sep = "")))
##D }
##D str(tree.joint)
##D 
##D # plot trees
##D par(mfrow = c(2, 3))
##D plot(tree.anc, main = paste("anc (", K, ")", sep = ""))
##D axis(1)
##D for(k in 1:K){
##D   plot(tree.dec[[k]], main = paste("dec", k, " (", N.k[k], ")", sep = ""))
##D   axis(1)
##D }
##D plot(tree.joint, main = paste("joint (", N, ")", sep = ""))
##D axis(1)
##D 
##D # use tbs option (an example from msdoc.pdf by Hudson, R.R.)
##D tbs.matrix <- matrix(c(3.0, 3.5, 5.0, 8.5), nrow = 2)
##D ret <- ms(nsam = 5, nreps = 2, opts = "-t tbs -r tbs 1000",
##D           tbs.matrix = tbs.matrix)
##D print(ret)
## End(Not run)



