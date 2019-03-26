library(flexclust)


### Name: shadowStars
### Title: Shadow Stars
### Aliases: shadowStars panelShadowViolin panelShadowBP
###   panelShadowSkeleton panelShadowStripes
### Keywords: methods hplot

### ** Examples

data(Nclus)
set.seed(1)
c5 <- cclust(Nclus, 5, save.data=TRUE)
c5
plot(c5)

shadowStars(c5)
shadowStars(c5, varwidth=TRUE)

shadowStars(c5, panel=panelShadowViolin)
shadowStars(c5, panel=panelShadowBP)

## always use varwidth=TRUE with panelShadowSkeleton, otherwise a few
## large shadow values can lead to misleading results:
shadowStars(c5, panel=panelShadowSkeleton)
shadowStars(c5, panel=panelShadowSkeleton, varwidth=TRUE)



