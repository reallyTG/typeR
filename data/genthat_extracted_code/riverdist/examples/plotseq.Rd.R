library(riverdist)


### Name: plotseq
### Title: Plot Sequence of Observations
### Aliases: plotseq

### ** Examples

data(Gulk, fakefish)

x <- mouthdistbysurvey(unique=fakefish$fish.id, survey=fakefish$flight.date, 
    seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
    
plotseq(seqbysurvey=x)
plotseq(seqbysurvey=x, type="boxline")
plotseq(seqbysurvey=x, type="dotplot")
plotseq(seqbysurvey=x, type="dotline")

plotseq(seqbysurvey=x, type="dotline", surveysareDates=TRUE)

from_upstreamseq <- upstreamseq(unique=fakefish$fish.id, 
   survey=fakefish$flight, seg=fakefish$seg, vert=fakefish$vert, 
   rivers=Gulk)
plotseq(seqbysurvey=from_upstreamseq)



