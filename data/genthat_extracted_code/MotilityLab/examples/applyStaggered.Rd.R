library(MotilityLab)


### Name: applyStaggered
### Title: Compute a Measure on a Track in a Staggered Fashion
### Aliases: applyStaggered

### ** Examples

## Compute the staggered matrix for overallAngle applied to all long enough 
## subtracks of the first T cell track
applyStaggered(TCells[[1]], overallAngle, matrix=TRUE, min.segments = 2)



