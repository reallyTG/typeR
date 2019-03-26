library(MotilityLab)


### Name: repairGaps
### Title: Process Tracks Containing Gaps
### Aliases: repairGaps

### ** Examples

## The Neutrophil data are imaged at rather nonconstant intervals
print( length( Neutrophils ) )
print( length( repairGaps( Neutrophils, tol=0.01 ) ) )



