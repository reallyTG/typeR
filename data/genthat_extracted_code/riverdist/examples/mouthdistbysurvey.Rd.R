library(riverdist)


### Name: mouthdistbysurvey
### Title: Distance From Mouth for All Observations of Individuals
### Aliases: mouthdistbysurvey

### ** Examples

data(Gulk, fakefish)

seqbysurvey <- mouthdistbysurvey(unique=fakefish$fish.id, survey=fakefish$flight.date, 
    seg=fakefish$seg, vert=fakefish$vert, rivers=Gulk)
seqbysurvey
plotseq(seqbysurvey)



