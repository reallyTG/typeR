library(ez)


### Name: ezBoot
### Title: Compute bootstrap resampled predictions
### Aliases: ezBoot

### ** Examples


#Read in the ANT data (see ?ANT).
data(ANT)
head(ANT)
ezPrecis(ANT)

#Run ezBoot on the accurate RT data
rt = ezBoot(
    data = ANT
    , dv = rt
    , wid = subnum
    , within = .(cue,flank)
    , between = group
    , iterations = 1e1 #1e3 or higher is best for publication
)

## Not run: 
##D #plot the full design
##D p = ezPlot2(
##D     preds = rt
##D     , x = flank
##D     , split = cue
##D     , col = group
##D )
##D print(p)
##D 
##D #plot the effect of group across the flank*cue design
##D p = ezPlot2(
##D     preds = rt
##D     , x = flank
##D     , split = cue
##D     , diff = group
##D )
##D print(p)
##D 
##D #plot the flank*cue design, averaging across group
##D p = ezPlot2(
##D     preds = rt
##D     , x = flank
##D     , split = cue
##D )
##D print(p)
## End(Not run)



