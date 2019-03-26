library(adephylo)


### Name: lizards
### Title: Phylogeny and quantitative traits of lizards
### Aliases: lizards
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D ## see data
##D data(lizards)
##D liz.tr <- read.tree(tex=lizards$hprA) # make a tree
##D liz <- phylo4d(liz.tr, lizards$traits) # make a phylo4d object
##D table.phylo4d(liz)
##D 
##D ## compute and plot principal components
##D if(require(ade4)){
##D liz.pca1 <- dudi.pca(lizards$traits, cent=TRUE,
##D    scale=TRUE, scannf=FALSE, nf=2) # PCA of traits
##D myPC <- phylo4d(liz.tr, liz.pca1$li) # store PC in a phylo4d object
##D varlab <- paste("Principal \ncomponent", 1:2) # make labels for PCs
##D table.phylo4d(myPC, ratio=.8, var.lab=varlab) # plot the PCs
##D add.scatter.eig(liz.pca1$eig,2,1,2,posi="topleft", inset=c(0,.15))
##D title("Phylogeny and the principal components")
##D 
##D ## compute a pPCA ##
##D ## remove size effect
##D temp <- lapply(liz.pca1$tab, function(e) residuals(lm(e~-1+liz.pca1$li[,1])) )
##D temp <- data.frame(temp)
##D row.names(temp) <- tipLabels(liz)
##D 
##D ## build corresponding phylo4d object
##D liz.noSize <- phylo4d(liz.tr, temp)
##D ppca1 <- ppca(liz.noSize, method="Abouheif", scale=FALSE, scannf=FALSE)
##D plot(ppca1)
##D 
##D }
##D }
## End(Not run)




