library(MetaCycle)


### Name: meta2d
### Title: Detect rhythmic signals from time-series datasets with multiple
###   methods
### Aliases: meta2d

### ** Examples

# write 'cycMouseLiverProtein' into a 'txt' file
write.table(cycMouseLiverProtein, file="cycMouseLiverProtein.txt",
  sep="\t", quote=FALSE, row.names=FALSE)
# write 'cycSimu4h2d' and 'cycYeastCycle' into two 'csv' files
write.csv(cycSimu4h2d, file="cycSimu4h2d.csv", row.names=FALSE)
write.csv(cycYeastCycle, file="cycYeastCycle.csv", row.names=FALSE)

# analyze 'cycMouseLiverProtein.txt' with JTK_CYCLE and Lomb-Scargle
meta2d(infile="cycMouseLiverProtein.txt", filestyle="txt",
  outdir="example", timepoints=rep(seq(0, 45, by=3), each=3),
  cycMethod=c("JTK","LS"), outIntegration="noIntegration")

# analyze 'cycSimu4h2d.csv' with ARSER, JTK_CYCLE and Lomb-Scargle and
# output integration file with analysis results from each method
meta2d(infile="cycSimu4h2d.csv", filestyle="csv", outdir="example",
  timepoints="Line1")

# analyze 'cycYeastCycle.csv' with ARSER, JTK_CYCLE and Lomb-Scargle to
# detect transcripts associated with cell cycle, and return analysis
# results instead of output them into files
cyc <- meta2d(infile="cycYeastCycle.csv",filestyle="csv",
  minper=80, maxper=96, timepoints=seq(2, 162, by=16),
  outputFile=FALSE, ARSdefaultPer=85, outRawData=TRUE)
head(cyc$ARS)
head(cyc$JTK)
head(cyc$LS)
head(cyc$meta)



