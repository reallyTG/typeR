library(wavethresh)


### Name: compgrot
### Title: Compute empirical shift for time ordered non-decimated
###   transforms.
### Aliases: compgrot
### Keywords: manip

### ** Examples

#
# Let's see how the resolution levels have to be shifted 
#
compgrot(4, filter.number=10, family="DaubExPhase")
#[1]  2  6 15 31
#
# In other words. Scale level 3 needs to be shifted two units.
# Scale level 2 needs to be shifted 6 units
# Scale level 1 needs to be shifted 15 units
# Scale level 0 needs to be shifted 31 units.



