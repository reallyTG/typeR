library(aqp)


### Name: aggregateSoilDepth
### Title: Probabalistic Estimation of Soil Depth
### Aliases: aggregateSoilDepth
### Keywords: manip

### ** Examples

data(sp1)
depths(sp1) <- id ~ top + bottom
site(sp1) <- ~ group

aggregateSoilDepth(sp1, 'group', crit.prob = 0.9, name='name')



