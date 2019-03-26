library(MotilityLab)


### Name: TrackMeasures
### Title: Track Measures
### Aliases: TrackMeasures asphericity displacement displacementRatio
###   displacementVector duration fractalDimension hurstExponent
###   maxDisplacement meanTurningAngle outreachRatio overallAngle
###   overallDot speed squareDisplacement straightness trackLength

### ** Examples

## show a turning angle plot with error bars for the T cell data.
with( (aggregate(BCells,overallDot,FUN="mean.se",na.rm=TRUE)),{
  plot( mean ~ i, xlab="time step", 
  	ylab="turning angle (rad)", type="l" )
  segments( i, lower, y1=upper )
} )




