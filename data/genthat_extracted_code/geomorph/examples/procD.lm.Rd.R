library(geomorph)


### Name: procD.lm
### Title: Procrustes ANOVA/regression for Procrustes shape variables
### Aliases: procD.lm
### Keywords: analysis

### ** Examples

### MANOVA example for Goodall's F test (multivariate shape vs. factors)
data(plethodon) 
Y.gpa <- gpagen(plethodon$land)    #GPA-alignment  
gdf <- geomorph.data.frame(shape = Y.gpa$coords, 
site = plethodon$site, species = plethodon$species) # geomorph data frame

procD.lm(shape ~ species * site, data = gdf, iter = 999, RRPP = FALSE) # randomize raw values
procD.lm(shape ~ species * site, data = gdf, iter = 999, RRPP = TRUE) # randomize residuals

### Regression example
data(ratland)
rat.gpa<-gpagen(ratland)         #GPA-alignment
gdf <- geomorph.data.frame(rat.gpa) # geomorph data frame is easy without additional input

procD.lm(coords ~ Csize, data = gdf, iter = 999, RRPP = FALSE) # randomize raw values
procD.lm(coords ~ Csize, data = gdf, iter = 999, RRPP = TRUE) # randomize raw values
# Outcomes should be exactly the same

### Extracting objects and plotting options
rat.anova <- procD.lm(coords ~ Csize, data = gdf, iter = 999, RRPP = TRUE)
summary(rat.anova)
# diagnostic plots
plot(rat.anova, type = "diagnostics") 
# diagnostic plots, including plotOutliers
plot(rat.anova, type = "diagnostics", outliers = TRUE) 
# PC plot rotated to major axis of fitted values
plot(rat.anova, type = "PC", pch = 19, col = "blue") 
# Uses residuals from model to find the commonom regression component 
# for a predictor from the model
plot(rat.anova, type = "regression", predictor = gdf$Csize, reg.type = "CRC", 
pch = 19, col = "green")
# Uses residuals from model to find the projected regression scores
rat.plot <- plot(rat.anova, type = "regression", predictor = gdf$Csize, reg.type = "RegScore", 
pch = 21, bg = "yellow") 

# TPS grids for min and max scores in previous plot
preds <- shape.predictor(gdf$coords, x = rat.plot$RegScore, 
                        predmin = min(rat.plot$RegScore), 
                        predmax = max(rat.plot$RegScore))
M <- rat.gpa$consensus
plotRefToTarget(M, preds$predmin, mag=3)
plotRefToTarget(M, preds$predmax, mag=3)
                        
attributes(rat.anova)
rat.anova$fitted # just the fitted values



