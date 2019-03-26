library(astrochron)


### Name: sedRamp
### Title: Apply 'ramping' sedimentation rate model to convert time to
###   stratigraphy
### Aliases: sedRamp

### ** Examples

# generate example series with 3 precession terms using function 'cycles'
# then convert from time to space using sedimentation rate that increases from 1 to 7 cm/ka
ex=sedRamp(cycles(),srstart=0.01,srend=0.07)



