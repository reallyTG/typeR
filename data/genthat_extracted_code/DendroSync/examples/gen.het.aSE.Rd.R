library(DendroSync)


### Name: gen.het.aSE
### Title: Within-group synchrony for heteroscedastic mixed models
### Aliases: gen.het.aSE

### ** Examples

## Calculate within-group heterosdecastic synchrony and SE for conifersIP data:
 data(conifersIP)
 
 #Fit the heteroscedastic set of varcov models (mBE, mHeNE, mHeCS, mHeUN)
 # using taxonomic grouping criteria (i.e. Species)
 ModHt <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = FALSE)
 summary(ModHt)
   
 #Obtain the heteroscedastic within-group synchrony and SE for each varGroup stratum.
 gen.het.aSE(ModHt$mHeNE)#Narrow evaluation model
 gen.het.aSE(ModHt$mHeUN)#Unstructured model
 



