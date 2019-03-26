library(DendroSync)


### Name: csbet.aSE
### Title: Between-group synchrony for homoscedastic compound symmetry
###   model
### Aliases: csbet.aSE

### ** Examples

## Calculate between-group homoscedastic synchrony and SE
 # for compound symmetry homocedastic model of conifersIP data:
 data(conifersIP)
 
 #Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = TRUE)
 summary(ModHm)
   
 #Obtain the compound symmetry model between-group synchrony and SE
 # for each varGroup stratum.
 csbet.aSE (ModHm$mCS)#compound symmetry
   



