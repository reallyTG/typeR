library(ade4)


### Name: bwca.dpcoa
### Title: Between- and within-class double principal coordinate analysis
### Aliases: bwca.dpcoa bca.dpcoa wca.dpcoa randtest.betwit summary.betwit
###   print.witdpcoa print.betdpcoa
### Keywords: multivariate

### ** Examples

## Not run: 
##D 
##D ## First example of Dray et al (2015) paper
##D 
##D con <- url("ftp://pbil.univ-lyon1.fr/pub/datasets/dray/MER2014/soilmicrob.rda")
##D load(con)
##D close(con)
##D 
##D ## Partial CCA
##D coa <- dudi.coa(soilmicrob$OTU, scannf = FALSE)
##D wcoa <- wca(coa, soilmicrob$env$pH, scannf = FALSE)
##D wbcoa <- bca(wcoa,soilmicrob$env$VegType, scannf = FALSE)
##D 
##D ## Classical DPCoA
##D dp <- dpcoa(soilmicrob$OTU, soilmicrob$dphy, RaoDecomp = FALSE, scannf = FALSE)
##D 
##D ## Between DPCoA (focus on the effect of vegetation type)
##D bdp <- bca(dp, fac = soilmicrob$env$VegType , scannf = FALSE)
##D bdp$ratio ## 0.2148972
##D randtest(bdp) ## p = 0.001
##D 
##D ## Within DPCoA (remove the effect of pH)
##D wdp <- wca(dp, fac = soilmicrob$env$pH, scannf = FALSE)
##D wdp$ratio ## 0.5684348
##D 
##D ## Between Within-DPCoA (remove the effect of pH and focus on vegetation type)
##D wbdp <- bwca.dpcoa(dp, fac = soilmicrob$env$VegType, cofac =  soilmicrob$env$pH, scannf = FALSE)
##D wbdp$ratio ## 0.05452813
##D randtest(wbdp) ## p = 0.001
## End(Not run)



