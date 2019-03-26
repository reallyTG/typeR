library(riverdist)


### Name: upstreammatbysurvey
### Title: Upstream Distance Matrix of All Observations of an Individual
### Aliases: upstreammatbysurvey

### ** Examples

data(Gulk, fakefish)
upstreammatbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
     
upstreammatbysurvey(indiv=1, unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk, full=FALSE)



