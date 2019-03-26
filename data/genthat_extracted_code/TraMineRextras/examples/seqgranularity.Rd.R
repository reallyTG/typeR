library(TraMineRextras)


### Name: seqgranularity
### Title: Changing sequence time granularity by aggregating positions
### Aliases: seqgranularity
### Keywords: utility

### ** Examples

data(mvad)
mvad <- mvad[1:100,]
mvad.seq <- seqdef(mvad[,17:86], xtstep=12)
mvadg.seq <- seqgranularity(mvad.seq, tspan=6, method="first")
par(mfrow=c(2,1))
seqdplot(mvad.seq, with.legend=FALSE, border=NA)
seqdplot(mvadg.seq, with.legend=FALSE)



