library(qtlcharts)


### Name: iplotScanone
### Title: Interactive LOD curve
### Aliases: iplotScanone
### Keywords: hplot

### ** Examples

library(qtl)
data(hyper)
hyper <- calc.genoprob(hyper, step=1)
out <- scanone(hyper)
## No test: 
# iplotScanone with no effects
iplotScanone(out, chr=c(1, 4, 6, 7, 15))
## End(No test)

## No test: 
# iplotScanone with CIs
iplotScanone(out, hyper, chr=c(1, 4, 6, 7, 15))
## End(No test)

## No test: 
# iplotScanone with raw phe x gen
iplotScanone(out, hyper, chr=c(1, 4, 6, 7, 15),
             pxgtype='raw')
## End(No test)




