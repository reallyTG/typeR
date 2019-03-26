library(qtlcharts)


### Name: iplotMScanone
### Title: Interactive LOD curve
### Aliases: iplotMScanone
### Keywords: hplot

### ** Examples

data(grav)
library(qtl)
grav <- calc.genoprob(grav, step=1)
grav <- reduce2grid(grav)

# we're going to subset the phenotypes
phecol <- seq(1, nphe(grav), by=5)

# the times were saved as an attributed
times <- attr(grav, "time")[phecol]

# genome scan
out <- scanone(grav, phe=phecol, method="hk")

## No test: 
# plot with qualitative labels on y-axis
iplotMScanone(out)
## End(No test)

## No test: 
# plot with quantitative y-axis
iplotMScanone(out, times=times)
## End(No test)

# estimate QTL effect for each time point at each genomic position
eff <- estQTLeffects(grav, phe=seq(1, nphe(grav), by=5), what="effects")

## No test: 
# plot with QTL effects included (and with quantitative y-axis)
iplotMScanone(out, effects=eff, times=times,
              chartOpts=list(eff_ylab="QTL effect", eff_xlab="Time (hrs)"))
## End(No test)




