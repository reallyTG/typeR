library(DendroSync)


### Name: cswi.aSE
### Title: Within-group synchrony for homoscedastic compound symmetry model
### Aliases: cswi.aSE

### ** Examples

## Calculate within-group homoscedastic synchrony and SE
 # for compound symmetry homocedastic model of conifersIP data:
 data(conifersIP)
 
 #Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = TRUE)
 summary(ModHm)
   
 #Obtain the compound symmetry model within-group synchrony and SE
 # for each varGroup stratum.
 cswi.aSE(ModHm$mCS)#compound symmetry
   



