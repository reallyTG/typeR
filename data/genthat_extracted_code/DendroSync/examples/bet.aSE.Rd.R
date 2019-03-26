library(DendroSync)


### Name: bet.aSE
### Title: Between-group synchrony for a homoscedastic unstructured model
### Aliases: bet.aSE

### ** Examples

## Calculate between-group synchrony and SE
 # for an unstructured homocedastic model of conifersIP data:
 data(conifersIP)
 
 #Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = TRUE)
 summary(ModHm)
   
 #Obtain the unstructured model between-group synchrony and SE
 # for each varGroup stratum.
 bet.aSE(ModHm$mUN)#Unstructure
   



