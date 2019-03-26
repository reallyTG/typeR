library(qtlcharts)


### Name: grav
### Title: Arabidopsis QTL data on gravitropism
### Aliases: grav
### Keywords: datasets

### ** Examples

data(grav)
times <- attr(grav, "time")
phe <- grav$pheno
## No test: 
iplotCurves(phe, times, phe[,c(61,121)], phe[,c(121,181)],
            chartOpts=list(curves_xlab="Time (hours)", curves_ylab="Root tip angle (degrees)",
                           scat1_xlab="Angle at 2 hrs", scat1_ylab="Angle at 4 hrs",
                           scat2_xlab="Angle at 4 hrs", scat2_ylab="Angle at 6 hrs"))
## End(No test)



