library(riverdist)


### Name: upstreamseq
### Title: Upstream Distance Between Sequential Observations
### Aliases: upstreamseq

### ** Examples

data(Gulk, fakefish)

# Mouth must be specified
Gulk$mouth$mouth.seg <- 1
Gulk$mouth$mouth.vert <- 1

upstreamseq(unique=fakefish$fish.id, survey=fakefish$flight, seg=fakefish$seg,
      vert=fakefish$vert, rivers=Gulk)

seqbysurvey <- upstreamseq(unique=fakefish$fish.id, survey=fakefish$flight.date, seg=fakefish$seg,
      vert=fakefish$vert, rivers=Gulk)
seqbysurvey
plotseq(seqbysurvey)



