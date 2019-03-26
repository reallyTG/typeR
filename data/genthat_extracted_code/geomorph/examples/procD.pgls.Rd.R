library(geomorph)


### Name: procD.pgls
### Title: Phylogenetic ANOVA/regression for Procrustes shape variables
### Aliases: procD.pgls
### Keywords: analysis

### ** Examples

### Example of D-PGLS for high-dimensional data 
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
gdf <- geomorph.data.frame(Y.gpa, phy = plethspecies$phy)
procD.pgls(coords ~ Csize, phy = phy, data = gdf, iter = 999) 

# The same analysis with procD.lm
PCov <- vcv.phylo(plethspecies$phy) # requires ape package
procD.lm(coords ~ Csize, Cov = PCov, data = gdf, iter = 999, RRPP = TRUE)

### Extracting objects
pleth.pgls <- procD.pgls(coords ~ Csize, phy = phy, data = gdf, iter = 999)
summary(pleth.pgls) 
plot(pleth.pgls)
pleth.pgls$Pcov # the projection matrix derived from the phylogenetic covariance matrix
pleth.pgls$pgls.fitted #the PGLS fitted values 



