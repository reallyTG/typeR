library(multilaterals)


### Name: growth
### Title: Compute growth rates of indexes
### Aliases: growth

### ** Examples


library(parallel)
library(igraph)
library(ape)

data('multil_data')
indx = multilateral(dat.q,dat.p,var.agg=c('year','region'),
 transitivity = 'mst', bench = 1, period =2010,
 idx = 'fisher', PAR= FALSE, Cores = detectCores(),plotting= FALSE)
 
indx = as.data.frame(do.call('cbind',list(indx)))
names(indx) = 'indx'
## try
indx$year = substr(rownames(indx),start=nchar(rownames(indx))-3,stop=nchar(rownames(indx)))
indx$region = substr(rownames(indx),start=nchar(rownames(indx))-6,stop=nchar(rownames(indx))-5)

growth(indx, var.agg=c('year','region'))




