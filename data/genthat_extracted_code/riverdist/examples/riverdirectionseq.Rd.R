library(riverdist)


### Name: riverdirectionseq
### Title: River Travel Direction Between Sequential Observations
### Aliases: riverdirectionseq

### ** Examples

data(Gulk, fakefish)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

riverdirectionseq(unique=fakefish$fish.id, survey=fakefish$flight, seg=fakefish$seg,
   vert=fakefish$vert, rivers=Gulk)

riverdirectionseq(unique=fakefish$fish.id, survey=fakefish$flight.date, seg=fakefish$seg,
   vert=fakefish$vert, rivers=Gulk)



