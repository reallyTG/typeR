library(metaplus)


### Name: plot.metaplus
### Title: Produces forest plot for the studies together with the
###   meta-analysis results.
### Aliases: plot.metaplus
### Keywords: method

### ** Examples

## Not run: 
##D # produce all 3 models for the CDP data and plot them all
##D cdp1 <- metaplus(yi,sei,plotci=TRUE,slab=study,data=cdp)
##D cdp2 <- metaplus(yi,sei,plotci=TRUE,slab=study,random="t-dist",data=cdp)
##D cdp3 <- metaplus(yi,sei,plotci=TRUE,slab=study,random="mixture",data=cdp)
##D plot(cdp1,extrameta=list(cdp2,cdp3))
##D 
##D # plot effect of exercise on depression at 4, 8 and 12 weeks
##D exercise$duration4 <- exercise$duration-4
##D exercise$duration8 <- exercise$duration-8
##D exercise$duration12 <- exercise$duration-12
##D 
##D exercise.wk4 <- metaplus(smd,sqrt(varsmd),mods=duration4,
##D   label="Random Mixture (Week 4)",slab=study,random="mixture",data=exercise)
##D exercise.wk8 <- metaplus(smd,sqrt(varsmd),mods=duration8,
##D   label="Random Mixture (Week 8)",slab=study,random="mixture",data=exercise)
##D exercise.wk12 <- metaplus(smd,sqrt(varsmd),mods=duration12,
##D   label="Random Mixture (Week 12)",slab=study,random="mixture",data=exercise)
##D 
##D exercise.nodurn <- metaplus(smd,sqrt(varsmd),plotci=TRUE,
##D    label="Random Mixture (No Duration)",slab=study,random="mixture",data=exercise)
##D 
##D plot(exercise.nodurn,extrameta=list(exercise.wk4,exercise.wk8,exercise.wk12))
## End(Not run)



