library(vcdExtra)


### Name: HairEyePlace
### Title: Hair Color and Eye Color in Caithness and Aberdeen
### Aliases: HairEyePlace
### Keywords: datasets

### ** Examples

data(HairEyePlace)

# separate mosaics
mosaic(HairEyePlace[,,1], shade=TRUE, main="Caithness")
mosaic(HairEyePlace[,,2], shade=TRUE, main="Aberdeen")

# condition on Place
mosaic(~Hair + Eye |Place, data=HairEyePlace, shade=TRUE, legend=FALSE)

cotabplot(~Hair+Eye|Place, data=HairEyePlace, shade=TRUE, legend=FALSE)



