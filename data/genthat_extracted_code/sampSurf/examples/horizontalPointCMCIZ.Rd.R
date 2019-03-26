library(sampSurf)


### Name: horizontalPointCMCIZ
### Title: Generate Objects of Class "'horizontalPointCMCIZ'"
### Aliases: horizontalPointCMCIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# restrict CMC sampling between 10-20m height, with 2
# subsamples to be taken on the tree at each grid cell...
#
st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
cmchps.iz = horizontalPointCMCIZ(st, ag, segBnds=c(10,20),
            n.s=2)
summary(cmchps.iz)
plot(cmchps.iz)



