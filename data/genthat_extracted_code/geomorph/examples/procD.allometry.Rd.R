library(geomorph)


### Name: procD.allometry
### Title: Procrustes ANOVA/regression, specifically for shape-size
###   covariation (allometry)
### Aliases: procD.allometry
### Keywords: analysis

### ** Examples

# Simple allometry
data(plethodon) 
Y.gpa <- gpagen(plethodon$land, print.progress = FALSE)    #GPA-alignment  

gdf <- geomorph.data.frame(Y.gpa, site = plethodon$site, 
species = plethodon$species) 
plethAllometry <- procD.allometry(coords~Csize, f2 = NULL, f3=NULL, 
logsz = TRUE, data=gdf, iter=149, print.progress = FALSE)
summary(plethAllometry)
plot(plethAllometry, method = "PredLine")
plot(plethAllometry, method = "RegScore")

## Obtaining size-adjusted residuals (and allometry-free shapes)
plethAnova <- procD.lm(plethAllometry$formula,
     data = plethAllometry$data, iter = 99, RRPP=TRUE, print.progress = FALSE) 
summary(plethAnova) # same ANOVA Table
shape.resid <- arrayspecs(plethAnova$residuals,
   p=dim(Y.gpa$coords)[1], k=dim(Y.gpa$coords)[2]) # allometry-adjusted residuals
adj.shape <- shape.resid + array(Y.gpa$consensus, dim(shape.resid)) # allometry-free shapes
plotTangentSpace(adj.shape) # PCA of allometry-free shape

# Group Allometries
plethAllometry <- procD.allometry(coords~Csize, ~species * site, 
logsz = TRUE, data=gdf, iter=99, RRPP=TRUE, print.progress = FALSE)
summary(plethAllometry)
plot(plethAllometry, method = "PredLine")

# Using procD.lm to call procD.allometry (in case more results are desired)
plethANOVA <- procD.lm(plethAllometry$formula, 
data = plethAllometry$data, iter = 149, RRPP=TRUE, print.progress = FALSE)
summary(plethANOVA) # Same ANOVA

# procD.allometry is a wrapper function for procD.lm.  The same analyses
# can be performed with procD.lm, and better graphics options
# are available. More complex models can be considered.
  
# Here are some examples using procD.lm, instead, offering greater flexibility.

data(larvalMorph)
Y.gpa <- gpagen(larvalMorph$tailcoords, curves = larvalMorph$tail.sliders, print.progress = FALSE)
gdf <- geomorph.data.frame(Y.gpa, Treatment = larvalMorph$treatment, 
Family = larvalMorph$family)

# procD.allometry approach
tailAllometry <- procD.allometry(coords ~ Csize, ~ Treatment,
logsz = TRUE, alpha = 0.05, data = gdf, iter = 149, print.progress = FALSE)
summary(tailAllometry) # HOS test suggests parallel allometries, but not unambiguous
plot(tailAllometry, method = "PredLine")

# procD.lm approach, including interaction
tailAllometry2 <- procD.lm(coords ~ log(Csize) * Treatment, data = gdf, iter = 149, 
     print.progress = FALSE)
plot(tailAllometry2, type = "regression", 
predictor = log(gdf$Csize), 
reg.type = "PredLine", 
pch = 21, 
bg = as.numeric(gdf$Treatment), 
xlab = "log(CS)") # greater flexibility

# including nested family effects, but still plotting by treatment
tailAllometry3 <- procD.lm(coords ~ log(Csize) * Treatment + 
Treatment/Family, data = gdf, iter = 149, print.progress = FALSE)
tailAllometry3 <- nested.update(tailAllometry3, ~ Treatment/Family)
summary(tailAllometry3)
plot(tailAllometry3, type = "regression", 
predictor = log(gdf$Csize), 
reg.type = "PredLine", 
pch = 21, 
bg = as.numeric(gdf$Treatment), 
xlab = "log(CS)")




