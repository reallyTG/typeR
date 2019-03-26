library(riverdist)


### Name: plotmatbysurveylist
### Title: Plot Upstream Distance Between Observations of All Individuals
### Aliases: plotmatbysurveylist

### ** Examples

data(Gulk, smallset)
matbysurveylist <- matbysurveylist(unique=smallset$id, survey=smallset$flight, seg=smallset$seg, 
   vert=smallset$vert, rivers=Gulk)
plotmatbysurveylist(matbysurveylist)
plotmatbysurveylist(matbysurveylist,type="confint")
plotmatbysurveylist(matbysurveylist,type="dotplot")
   
data(fakefish)
# matbysurveylist <- matbysurveylist(unique=fakefish$fish.id, survey=fakefish$flight, 
#   seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
# plotmatbysurveylist(matbysurveylist)



