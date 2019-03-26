library(OutbreakTools)


### Name: plotGeo
### Title: Function to plot cases on a map
### Aliases: plotGeo

### ** Examples

## Not run: 
##D ## load the obkData of equine influenza outbreak
##D data(HorseFlu)
##D x <- HorseFlu
##D 
##D ## plot the individuals on a map
##D plotGeo(x,location=c('lon','lat'),zoom=8)
##D 
##D ## color by sex
##D plotGeo(x,location=c('lon','lat'),zoom=8,colorBy='sex')
##D 
##D ## zoom in on the small cluster, by centering on individual '9'
##D plotGeo(x,location=c('lon','lat'),colorBy="sex",zoom=14,center='9',size=4,
##D   alpha=(.7))
##D 
##D plotGeo(x,location=c('lon','lat'),colorBy="yardID", shapeBy="sex", zoom=14,center='9',size=4,
##D   alpha=(.7))
##D 
##D ## another example ##
##D ## load obkData object containing data about a simulated outbreak
##D data(ToyOutbreak)
##D 
##D ## plot the individuals on a map
##D plotGeo(ToyOutbreak,location=c('lon','lat'), zoom=8)
##D plotGeo(ToyOutbreak,location=c('lon','lat'), zoom=13, colorBy='Sex', size=3)
##D 
##D ## color by age, zooming on the first case of the outbreak: indivudal 1
##D plotGeo(ToyOutbreak,location=c('lon','lat'), zoom=15,
##D         colorBy='Age', center='1', size=5)
## End(Not run)




