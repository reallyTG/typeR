library(spider)


### Name: monophyly
### Title: Species monophyly over a tree
### Aliases: monophyly

### ** Examples


#Random trees
set.seed(16)
tr <- ape::rtree(15)
spp <- rep(LETTERS[1:5], rep(3,5))
monophyly(tr, spp)

tr2 <- tr
spp2 <- c(rep(LETTERS[1:4], rep(3,4)), LETTERS[5:7])
monophyly(tr2, spp2)

#Empirical data
## Not run: 
##D data(anoteropsis)
##D anoTree <- ape::nj(ape::dist.dna(anoteropsis))
##D anoSpp <- sapply(strsplit(dimnames(anoteropsis)[[1]], split="_"), 
##D     function(x) paste(x[1], x[2], sep="_"))
##D 
##D monophyly(anoTree, anoSpp)
##D monophyly(anoTree, anoSpp, singletonsMono=FALSE)
##D unique(anoSpp)
##D 
##D #To get score for each individual
##D anoMono <- monophyly(anoTree, anoSpp)
##D anoMono[match(anoSpp, unique(anoSpp))]
##D 
##D data(woodmouse)
##D woodTree <- ape::nj(ape::dist.dna(woodmouse))
##D woodSpp <- c("D", "C", "C", "A", "A", "E", "A", "F", "C", "F", "E", "D", "A", "A", "E")
##D unique(woodSpp)
##D monophyly(woodTree, woodSpp)
##D woodMono <- monophylyBoot(woodTree, woodSpp, woodmouse)
##D woodMono$results
##D woodMono$BSvalues
##D 
##D monophylyBoot(woodTree, woodSpp, woodmouse, reroot = FALSE)
##D monophylyBoot(woodTree, woodSpp, woodmouse, thresh = 0.9, reroot = FALSE)
## End(Not run)





