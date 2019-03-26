library(DendroSync)


### Name: csbet.het.aSE
### Title: Between-group synchrony for heteroscedastic compound symmetry
###   model
### Aliases: csbet.het.aSE

### ** Examples

## Calculate between-group synchrony and SE 
 ##for heteroscedastic compound symmetry model for conifersIP data:
 data(conifersIP)
 
 #Fit the heteroscedastic set of varcov models (mBE, mHeNE, mHeCS, mHeUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHt <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = FALSE)
 
 #between-group synchrony and SE for each varGroup stratum combination
 # in heteroscedastic compound symmetry models.
 csbet.het.aSE(ModHt$mHeCS)
 



