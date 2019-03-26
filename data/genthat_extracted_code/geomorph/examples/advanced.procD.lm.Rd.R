library(geomorph)


### Name: advanced.procD.lm
### Title: Procrustes ANOVA and pairwise tests for shape data, using
###   complex linear models
### Aliases: advanced.procD.lm
### Keywords: analysis

### ** Examples

data(plethodon)
Y.gpa<-gpagen(plethodon$land, print.progress = FALSE)    #GPA-alignment
gdf <- geomorph.data.frame(Y.gpa, species = plethodon$species, 
site = plethodon$site)

# Example of a nested model comparison (as with ANOVA with RRPP)
ANOVA <-  advanced.procD.lm(f1= coords ~ log(Csize) + species,
f2= ~ log(Csize)*species*site, iter=99, data = gdf)
summary(ANOVA, formula = FALSE) # formulas too long to print

# Example of a test of a factor interaction, plus pairwise comparisons
PW.means.test <- advanced.procD.lm(f1= coords ~ site*species, f2= ~ site + species, 
groups = ~site*species, iter=99, data = gdf)
summary(PW.means.test, formula = TRUE)

# Example of a test of a factor interaction, plus pairwise comparisons,
# accounting for a common allometry
PW.ls.means.test <- advanced.procD.lm(f1= coords ~ Csize + site*species,
f2= ~ log(Csize) + site + species,
groups = ~ site*species, iter = 99, data = gdf)
summary(PW.ls.means.test, formula = TRUE)

# Example of a test of homogeneity of slopes, plus pairwise slopes comparisons
gdf$group <- factor(paste(gdf$species, gdf$site, sep="."))
HOS <- advanced.procD.lm(f1= coords ~ log(Csize) + group,
f2= ~ log(Csize) * group, groups = ~ group,
slope = ~ log(Csize), angle.type = "deg", iter = 99, data = gdf)
summary(HOS, formula = FALSE) # formulas too long to print

# Example of partial pairwise comparisons, given greater model complexity.
# Plus, working with class advanced.procD.lm objects.
aov.pleth <- advanced.procD.lm(f1= coords ~ log(Csize)*site*species,
f2= ~ log(Csize) + site*species, groups = ~ species, 
slope = ~ log(Csize), angle.type = "deg", iter = 99, data = gdf)

summary(aov.pleth, formula = FALSE)  # formulas too long to print

# Diagnostic plots
plot(aov.pleth) 

# Extracting objects from results
aov.pleth$slopes # extract the slope vectors

# GLS Examples (same as procD.gpls example)
data(plethspecies)
Y.gpa<-gpagen(plethspecies$land)    
gdf <- geomorph.data.frame(Y.gpa, tree = plethspecies$phy)
procD.pgls(coords ~ Csize, phy = tree, data = gdf, iter = 999)

advanced.procD.lm(coords ~ Csize, ~1, phy = gdf$tree, data = gdf, iter = 999)

# Could also do this with ape function
# phyCov <- vcv.phylo(plethspecies$phy)
# advanced.procD.lm(coords ~ Csize, ~1, Cov = phyCov, data = gdf, iter = 999)




