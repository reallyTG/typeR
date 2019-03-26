library(geomorph)


### Name: morphol.disparity
### Title: Morphological disparity for one or more groups of specimens
### Aliases: morphol.disparity
### Keywords: analysis

### ** Examples

data(plethodon)
Y.gpa<-gpagen(plethodon$land, print.progress = FALSE)    #GPA-alignment
gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, site = plethodon$site)

# Morphological disparity for entire data set
morphol.disparity(coords ~ 1, groups= NULL, data = gdf, iter=499)

# Morphological disparity for entire data set, accounting for allometry
morphol.disparity(coords ~ Csize, groups= NULL, data = gdf, iter=499)

# Morphological disparity without covariates, using overall mean
morphol.disparity(coords ~ 1, groups= ~ species*site, data = gdf, iter=499)

# Morphological disparity without covariates, using group means
morphol.disparity(coords ~ species*site, groups= ~species*site, data = gdf, iter=499)

# Morphological disparity of different groups than those described by the linear model
morphol.disparity(coords ~ Csize + species*site, groups= ~ species, data = gdf, iter=499)

# Extracting components
MD <- morphol.disparity(coords ~ Csize + species*site, groups= ~ species, data = gdf, iter=499)
MD$Procrustes.var # just the Procrustes variances


### Morphol.disparity can be used with procD.lm or advanced.procD.lm class objects

data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    #GPA-alignment
gp.end<-factor(c(0,0,1,0,0,1,1,0,0))  #endangered species vs. rest
names(gp.end)<-plethspecies$phy$tip

gdf <- geomorph.data.frame(Y.gpa, phy = plethspecies$phy, gp.end = gp.end)

pleth.ols <- procD.lm(coords ~ Csize + gp.end, 
data = gdf, iter = 999) # ordinary least squares
pleth.pgls <- procD.pgls(coords ~ Csize + gp.end, phy = phy, 
data = gdf, iter = 999) # phylogenetic generalized least squares

summary(pleth.ols)
summary(pleth.pgls)

morphol.disparity(f1 = pleth.ols, groups = ~ gp.end, data = gdf, iter = 999)
morphol.disparity(f1 = pleth.pgls, groups = ~ gp.end, data = gdf, iter = 999)




