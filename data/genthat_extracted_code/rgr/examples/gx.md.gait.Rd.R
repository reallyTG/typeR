library(rgr)


### Name: gx.md.gait
### Title: Function for Multivariate Graphical Adaptive Interactive
###   Trimming
### Aliases: gx.md.gait
### Keywords: multivariate hplot iplot

### ** Examples

## Note, the example below is presented for historical continuity.  It is 
## not recommended that this procedure be used for geochemical data.  For
## such data function gx.md.gait.closed should be employed.  However, the
## example below is consistent with Garrett (1989).
## Make test data available
data(sind)
attach(sind)
sind.mat <- as.matrix(sind[, -c(1:3)])

## Undertake original published GAIT procedure
gx.md.gait(sind.mat)
sind.gait.1 <- gx.md.gait(sind.mat, trim = 0.24, ifadd = 0.98) 
sind.gait.2 <- gx.md.gait(sind.mat, wts = sind.gait.1$wts, mvtstart = TRUE,
trim = 4, ifadd = 0.98)
sind.gait.3 <- gx.md.gait(sind.mat, wts = sind.gait.2$wts, trim = 1,
ifadd = 0.9)
sind.gait.4 <- gx.md.gait(sind.mat, wts = sind.gait.3$wts, trim = 2,
ifadd = 0.9)

## Display saved object with alternate main titles and list outliers
## IDEAS procedure
gx.md.plot(sind.gait.4,
main = "Howarth & Sinding-Larsen\nStream Sediments, IDEAS procedure",
cex.main = 0.8, ifadd = 0.9)
gx.md.print(sind.gait.4, pcut = 0.2)

## Clean-up and detach test data
rm(sind.mat)
rm(sind.gait.1)
rm(sind.gait.2)
rm(sind.gait.3)
rm(sind.gait.4)
detach(sind)



