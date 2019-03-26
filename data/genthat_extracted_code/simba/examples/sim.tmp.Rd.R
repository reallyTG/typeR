library(simba)


### Name: sim.tmp
### Title: Calculate binary similarity in time
### Aliases: sim.tmp
### Keywords: methods multivariate

### ** Examples

data(bernina)
## load included data
data(bernina)

## how species changed occurrence between first recording
## and last recording?
# construct a species matrix that only contains the species
# that occurred on the summits at the first recording
first <- veg[summits$year=="1907",]
first <- first[,colSums(first)>0]
# make right summit names
row.names(first) <- as.character(summits$summit[summits$year=="1907"])
# construct a species matrix that only contains the species
# that occurred on the summits at the last recording
last <- veg[summits$year=="2003",]
last <- last[,colSums(last)>0]
# make right summit names
row.names(last) <- as.character(summits$summit[summits$year=="2003"])
# calculate similarity between time steps
sim.tmp(first, last)




