library(ade4)


### Name: dpcoa
### Title: Double principal coordinate analysis
### Aliases: dpcoa plot.dpcoa print.dpcoa summary.dpcoa
### Keywords: multivariate

### ** Examples

data(humDNAm)
dpcoahum <- dpcoa(data.frame(t(humDNAm$samples)), sqrt(humDNAm$distances), scan = FALSE, nf = 2)
dpcoahum
if(adegraphicsLoaded()) {
  g1 <- plot(dpcoahum)
} else {
  plot(dpcoahum)
}
  
## Not run: 
##D data(ecomor)
##D dtaxo <- dist.taxo(ecomor$taxo)
##D dpcoaeco <- dpcoa(data.frame(t(ecomor$habitat)), dtaxo, scan = FALSE, nf = 2)
##D dpcoaeco
##D 
##D if(adegraphicsLoaded()) {
##D   g1 <- plot(dpcoaeco)
##D } else {
##D   plot(dpcoaeco)
##D }
## End(Not run)


