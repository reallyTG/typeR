library(phylotools)


### Name: sub.taxa.label
### Title: Substitute the tip labels of a phylogenetic tree
### Aliases: sub.taxa.label

### ** Examples


library(ape)
data(bird.families)
tips <- bird.families$tip.label
abr <- paste("fam",1:length(tips), sep = "")
dat <- data.frame(tips, abr)
ntree <- sub.taxa.label(bird.families, dat)




