library(SDMTools)


### Name: ZonalStat
### Title: Landscape Zonal Statistics
### Aliases: ZonalStat

### ** Examples

#define a simple binary matrix
tmat = { matrix(c( 0,0,0,1,0,0,1,1,0,1,
                   0,0,1,0,1,0,0,0,0,0,
                   0,1,NA,1,0,1,0,0,0,1,
                   1,0,1,1,1,0,1,0,0,1,
                   0,1,0,1,0,1,0,0,0,1,
                   0,0,1,0,1,0,0,1,1,0,
                   1,0,0,1,0,0,1,0,0,1,
                   0,1,0,0,0,1,0,0,0,1,
                   0,0,1,1,1,0,0,0,0,1,
                   1,1,1,0,0,0,0,0,0,1),nr=10,byrow=TRUE) }

#do the connected component labelling
ccl.mat = ConnCompLabel(tmat)
ccl.mat #this is the zone matrix to be used

#create a random data matrix
data.mat = matrix(runif(100),nr=10,nc=10)
data.mat

#calculate the zonal statistics
zs.data = ZonalStat(data.mat,ccl.mat,FUN='all')
zs.data

#just calculate the sum
zs.data = ZonalStat(data.mat,ccl.mat,FUN='sum')
zs.data

#calculate sum & n & 'all' and show when a function is not defined
zs.data = ZonalStat(data.mat,ccl.mat,
    FUN=c('sum','length','not.a.function','all'))
zs.data
attr(zs.data,'excluded NAs') #show how many NAs were omitted from analysis



