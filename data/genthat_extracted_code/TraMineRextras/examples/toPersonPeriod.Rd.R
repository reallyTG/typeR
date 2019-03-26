library(TraMineRextras)


### Name: toPersonPeriod
### Title: Converting into person-period format.
### Aliases: toPersonPeriod
### Keywords: util

### ** Examples

data(mvad)
mvad.labels <- c("employment", "further education", "higher education",
    "joblessness", "school", "training")
mvad.scodes <- c("EM", "FE", "HE", "JL", "SC", "TR")
mvad.seq <- seqdef(mvad, 15:86, states = mvad.scodes, labels = mvad.labels)

mvad2 <- toPersonPeriod(mvad.seq[1:20,])



