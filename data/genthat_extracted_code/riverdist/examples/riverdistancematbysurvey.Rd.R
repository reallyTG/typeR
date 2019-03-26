library(riverdist)


### Name: riverdistancematbysurvey
### Title: River Distance Matrix of All Observations of an Individual
### Aliases: riverdistancematbysurvey

### ** Examples

data(Gulk, fakefish)
riverdistancematbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
     
riverdistancematbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, full=FALSE)



