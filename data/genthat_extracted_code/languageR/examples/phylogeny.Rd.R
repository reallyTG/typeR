library(languageR)


### Name: phylogeny
### Title: Phylogenetic relations between Papuan and Oceanic languages
### Aliases: phylogeny
### Keywords: datasets

### ** Examples
## Not run: 
##D data(phylogeny)
##D library(ape)
##D 
##D # joint analysis of both language families
##D 
##D phylogeny.dist = dist(phylogeny[ ,3:ncol(phylogeny)], method = "binary")
##D phylogeny.dist.tr = nj(phylogeny.dist)
##D families =
##D   as.character(phylogeny$Family[as.numeric(phylogeny.dist.tr$tip.label)])
##D languages =
##D   as.character(phylogeny$Language[as.numeric(phylogeny.dist.tr$tip.label)])
##D phylogeny.dist.tr$tip.label = languages
##D plot(phylogeny.dist.tr, type="u", font = as.numeric(as.factor(families)))
##D 
##D # analysis of subset of Papuan languages
##D 
##D papuan = phylogeny[phylogeny$Family == "Papuan",]
##D papuan$Language = as.factor(as.character(papuan$Language))
##D papuan.meta = papuan[ ,1:2]
##D papuan.mat = papuan[, 3:ncol(papuan)]
##D papuan.meta$Geography = c(
##D   "Bougainville", "Bismarck Archipelago", "Bougainville", 
##D   "Bismarck Archipelago", "Bismarck Archipelago", "Central Solomons",
##D   "Bougainville", "Louisiade Archipelago", "Bougainville", 
##D   "Bismarck Archipelago", "Bismarck Archipelago", 
##D   "Bismarck Archipelago", "Central Solomons", "Central Solomons", 
##D   "Central Solomons")
##D papuan.dist = dist(papuan.mat, method = "binary")
##D papuan.dist.tr = nj(papuan.dist)
##D fonts = 
##D   as.character(papuan.meta$Geography[as.numeric(
##D     papuan.dist.tr$tip.label)])
##D papuan.dist.tr$tip.label = 
##D   as.character(papuan.meta$Language[as.numeric(
##D     papuan.dist.tr$tip.label)])
##D plot(papuan.dist.tr, type = "u", font = as.numeric(as.factor(fonts)))
## End(Not run)


