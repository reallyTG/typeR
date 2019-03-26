library(simba)


### Name: occ.time
### Title: Track species occurrence
### Aliases: occ.time occ.tmp
### Keywords: methods multivariate

### ** Examples

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
# see that dimensions of first and last differ
dim(first)
dim(last)
# calculate change in occurrence
changed.occurrence <- occ.tmp(first, last)
barplot(changed.occurrence$bac, main="percentage of species 
that changed on ... plots")
# try the same but species are not given in percentages
changed.occurrence <- occ.tmp(first, last, perc=FALSE)
barplot(changed.occurrence$bac, main="number of species that 
changed on ... plots")
# there is a lot of info in the output
changed.occurrence




