library(MotilityLab)


### Name: aggregate.tracks
### Title: Compute Summary Statistics of Subtracks
### Aliases: aggregate.tracks

### ** Examples

## A mean square displacement plot with error bars.
dat <- aggregate(TCells, squareDisplacement, FUN="mean.se")
with( dat ,{
  plot( mean ~ i, xlab="time step", 
  	ylab="mean square displacement", type="l" )
  segments( i, lower, y1=upper )
} )

## Compute a turning angle plot for the B cell data, taking only steps of at least
## 1 micrometer length into account
check <- function(x) all( sapply( list(head(x,2),tail(x,2)), trackLength ) >= 1.0 )
plot( aggregate( BCells, overallAngle, subtrack.length=1:10, 
  filter.subtracks=check )[,2], type='l' )

## Compare 3 different variants of a mean displacement plot
# 1. average over all subtracks
plot( aggregate( TCells, displacement ), type='l' )
# 2. average over all non-overlapping subtracks
lines( aggregate( TCells, displacement, max.overlap=0 ), col=2 )
# 3. average over all subtracks starting at 1st position
lines( aggregate( TCells, displacement, by="prefixes" ), col=3 )




