library(TraMineRextras)


### Name: seqgen.missing
### Title: Generate random missing states within a state sequence object
### Aliases: seqgen.missing
### Keywords: utility

### ** Examples

## create the biofam.seq state sequence object from the biofam data.
data(biofam)
biofam.seq <- seqdef(biofam[1:100,10:25])

## Generate missing states within 60% of the sequences.
biofamm.seq <- seqgen.missing(biofam.seq, p.cases=.6,
      p.left=.4, p.gaps=.2, p.right=.5)

## compare the rendering of the sequences before and after
##   introducing missing states.
par(mfrow=c(2,2))
seqIplot(biofam.seq, sortv="from.end", with.legend=FALSE)
seqIplot(biofamm.seq, sortv="from.end", with.legend=FALSE)
seqdplot(biofam.seq, with.missing=TRUE, border=NA, with.legend=FALSE)
seqdplot(biofamm.seq, with.missing=TRUE, border=NA, with.legend=FALSE)
dev.off()



