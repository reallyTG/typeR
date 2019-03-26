library(riverdist)


### Name: riverdistanceseq
### Title: River Distance Between Sequential Observations
### Aliases: riverdistanceseq

### ** Examples

data(Gulk, fakefish)
riverdistanceseq(unique=fakefish$fish.id, survey=fakefish$flight,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
     
seqbysurvey <- riverdistanceseq(unique=fakefish$fish.id, survey=fakefish$flight.date,
      seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
seqbysurvey
plotseq(seqbysurvey)



