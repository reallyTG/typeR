library(DendroSync)


### Name: cswi.het.aSE
### Title: Within-group synchrony for heteroscedastic compound symmetry
###   mixed models
### Aliases: cswi.het.aSE

### ** Examples

## Calculate within-group heterosdecastic synchrony and SE for conifersIP data:
 data(conifersIP)
 
 #Fit the heteroscedastic set of varcov models (mBE, mHeNE, mHeCS, mHeUN)
 # using taxonomic grouping criteria (i.e. Species)
 ModHt <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = FALSE)
 summary(ModHt)
   
 #Obtain the heteroscedastic compound symmetry 
 #within-group synchrony and SE for each varGroup stratum.
 cswi.het.aSE(ModHt$mHeCS)
 
 



