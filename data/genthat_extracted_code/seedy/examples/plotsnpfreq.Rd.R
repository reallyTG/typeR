library(seedy)


### Name: plotsnpfreq
### Title: Plot frequency of polymorphic sites
### Aliases: plotsnpfreq

### ** Examples


data(deepseq)

# At the 25th time point
plotsnpfreq(data=deepseq, timepoint=25, xlab="Mutant frequency", ylim=c(0,25),
      ylab="No. sites", yaxs="i", xaxs="i", las=1, bty="l", col="red", lwd=2)
# At the 50th time point
plotsnpfreq(data=deepseq, timepoint=50, xlab="Mutant frequency", ylim=c(0,25),
      ylab="No. sites", yaxs="i", xaxs="i", las=1, bty="l", col="red", lwd=2)




