library(sampSurf)


### Name: horizontalPointISIZ
### Title: Generate Objects of Class "'horizontalPointISIZ'"
### Aliases: horizontalPointISIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
# restrict importance sampling between 10-20m height and use the
# "wbProxy" function with solid type = 0.9*4 (close to true taper);
# with 2 subsamples to be taken on the tree at each grid cell...
#
st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
ishps.iz = horizontalPointISIZ(st, ag, segBnds=c(10,20),
           proxy='wbProxy', solidTypeProxy=0.9, n.s=2)
summary(ishps.iz)
plot(ishps.iz)



