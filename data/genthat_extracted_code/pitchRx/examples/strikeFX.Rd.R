library(pitchRx)


### Name: strikeFX
### Title: Visualize PITCHf/x strikezones
### Aliases: strikeFX

### ** Examples

data(pitches)

strikeFX(pitches)
## Not run: 
##D strikeFX(pitches, layer=facet_grid(.~stand))
##D  #silly example on how to modify default settings and add layers
##D  strikeFX(pitches, color="", layer=facet_grid(s~stand))+
##D  geom_point(aes(x=px, y=pz, shape=pitch_types))+ #you could add color here
##D  geom_text(aes(x=px+0.5, y=pz, label=b))
##D 
##D  p <- strikeFX(pitches, geom="tile", layer=facet_grid(.~stand))
##D  p+theme(aspect.ratio=1)
##D 
##D strikeFX(pitches, geom="hex", density1=list(des="Called Strike"), density2=list(des="Ball"),
##D          draw_zones=FALSE, contour=TRUE, layer=facet_grid(.~stand))
##D 
##D noswing <- subset(pitches, des %in% c("Ball", "Called Strike"))
##D noswing$strike <- as.numeric(noswing$des %in% "Called Strike")
##D library(mgcv)
##D m1 <- bam(strike ~ s(px, pz, by=factor(stand)) +
##D                factor(stand), data=noswing, family = binomial(link='logit'))
##D # geom will automatically be set to 'raster'
##D strikeFX(noswing, model=m1, layer=facet_grid(.~stand))
##D 
##D m2 <- bam(strike ~ s(px, pz, by=factor(stand)) + s(px, pz, by=factor(inning_side)) +
##D            factor(stand) + factor(inning_side), data=noswing, family = binomial(link='logit'))
##D strikeFX(noswing, model=m2, density1=list(inning_side="top"),
##D          density2=list(inning_side="bottom"), layer=facet_grid(.~stand))
## End(Not run)



