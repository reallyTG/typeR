library(seedy)


### Name: plotobservedsnps
### Title: Plot expected frequency of polymorphic sites in a model deep
###   sequencing project
### Aliases: plotobservedsnps

### ** Examples


data(deepseq)

# At the 25th time point
plotobservedsnps(data=deepseq, timepoint=25, xaxt="n", xlab="Ranked polymorphic sites", 
      ylab="Reads", yaxs="i", las=1)
# At the 50th time point
plotobservedsnps(data=deepseq, timepoint=50, xaxt="n", xlab="Ranked polymorphic sites", 
      ylab="Reads", yaxs="i", las=1)




