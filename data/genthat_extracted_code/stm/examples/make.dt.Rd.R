library(stm)


### Name: make.dt
### Title: Make a 'data.table' of topic proportions.
### Aliases: make.dt

### ** Examples

dt <- make.dt(gadarianFit, meta=gadarian)
#now we can do any query.  For example the 5 least associated documents with Topic 2 in
#the treated group
dt[treatment==0, docnum[order(Topic2, decreasing=FALSE)][1:5]]




