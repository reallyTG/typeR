library(DiffNet)


### Name: diffnet
### Title: Detection of Statistically Significant Changes in Paired
###   Biological Networks
### Aliases: diffnet

### ** Examples

library("DiffNet")
# this step is optional, it helps speed up calculations, run in parallel on 2 processors
library(doParallel)
registerDoParallel(2)
# Run the differential network analysis tehcnique on sample data
p <- diffnet()



