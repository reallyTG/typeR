library(ade4)


### Name: hdpg
### Title: Genetic Variation In Human Populations
### Aliases: hdpg
### Keywords: datasets

### ** Examples

## Not run: 
##D   data(hdpg)
##D   freq <- char2genet(hdpg$tab, hdpg$ind$population)
##D   vec <- apply(freq$tab, 2, function(c) mean(c, na.rm = TRUE))
##D   for (j in 1:4492){
##D       freq$tab[is.na(freq$tab[,j]),j] = vec[j]}
##D   pcatot <- dudi.pca(freq$tab, center = TRUE, scale = FALSE, scannf = FALSE, nf = 4)
##D 
##D 
##D if(adegraphicsLoaded()) {
##D   s.label(pcatot$li, xax = 1, yax = 2, psub.text = "1-2", lab = freq$pop.names)
##D } else {
##D   s.label(pcatot$li, xax = 1, yax = 2, sub = "1-2", lab = freq$pop.names)
##D }
## End(Not run)



