library(ActivityIndex)


### Name: computeActivityIndex
### Title: Compute Activity Index
### Aliases: computeActivityIndex computeActivityIndex.default
###   computeActivityIndex.GT3XPlus

### ** Examples

library(graphics)
fname = system.file("extdata", "sample_table.csv.gz",
package = "ActivityIndex")
sampleTable = ReadTable(fname)
AI_sampleTable_x = computeActivityIndex(
  sampleTable,
  x_sigma0 = sampleTable[1004700:1005600, ],
  epoch = 1,
  hertz = 30)
AI_sampleTable_x
plot(AI ~ RecordNo, data = AI_sampleTable_x, type = "l")



