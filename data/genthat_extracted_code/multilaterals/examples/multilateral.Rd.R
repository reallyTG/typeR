library(multilaterals)


### Name: multilateral
### Title: multilateral: generate transitive index numbers for
###   cross-sections and panel data
### Aliases: multilateral

### ** Examples


library(igraph)
library(ape)
library(lattice)
library(parallel)

data('multil_data')


## Compare eks method with the mst method.
indx.mst = multilateral(dat.q,dat.p,
  idx='fisher', transitivity='mst',
   var.agg=c('year','region'),bench='1',
   period=2010,
   PAR=FALSE,
   plotting=FALSE,Cores=2)
indx.mst = as.data.frame(do.call('cbind',list(indx.mst)))
names(indx.mst) = 'mst'
indx.eks = multilateral(dat.q,dat.p,
  idx='fisher', transitivity='eks',
   var.agg=c('year','region'),bench='1',
   period=2010,
   PAR=FALSE,
   plotting=FALSE)
indx.eks = as.data.frame(do.call('cbind',list(indx.eks)))
names(indx.eks) = 'eks'
indx = cbind(indx.mst,indx.eks)
indx$year = as.numeric(substr(rownames(indx),
 start=nchar(rownames(indx))-3,stop=nchar(rownames(indx))))
indx$region = substr(rownames(indx),
 start=nchar(rownames(indx))-6,stop=nchar(rownames(indx))-5)

xyplot(mst+eks ~ year|region,indx,type='l')
   




