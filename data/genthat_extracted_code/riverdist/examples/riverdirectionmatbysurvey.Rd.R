library(riverdist)


### Name: riverdirectionmatbysurvey
### Title: River Direction Matrix of All Observations of an Individual
### Aliases: riverdirectionmatbysurvey

### ** Examples

data(Gulk, fakefish)
riverdirectionmatbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
     
riverdirectionmatbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, full=FALSE)



