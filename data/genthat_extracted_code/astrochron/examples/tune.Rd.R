library(astrochron)


### Name: tune
### Title: Tune stratigraphic series
### Aliases: tune

### ** Examples

# generate example series with 3 precession terms using function 'cycles'
ex1=cycles()

# then convert from time to space using a sedimentation rate that increases from 1 to 7 cm/ka
ex2=sedRamp(ex1,srstart=0.01,srend=0.07)

# assemble tuning control points (this is the depth-time map)
controlPts=cbind(ex2[,1],ex1[,1])

# tune record
ex3=tune(ex2,controlPts=controlPts)



