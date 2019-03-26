library(DendroSync)


### Name: sync
### Title: Calculate within- and between-group synchrony
### Aliases: sync

### ** Examples

## Calculate synchrony for null.model (broad evaluation, mBE) and homoscedastic variant
 # of unstructured model (or full, mUN) for conifersIP data, 
 # and heteroscedastic variant for 1970-1999 period.
 data(conifersIP)
 
 ##Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN) 
 #using taxonomic grouping criteria (i.e. Species)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conifersIP, homoscedastic = TRUE)
 
 summary(ModHm)# Class and length of list elements
 
 #Synchrony for mBE and mUN models
 sync(ModHm, modname = "mBE")
 sync(ModHm, modname = "mUN")
 
 ##Chop the data from 1970 to 1999.
 conif.30 <- conifersIP[conifersIP$Year>1969 & conifersIP$Year<2000,]
 summary(conif.30$Year)
 
 #Fit the heteroscedastic set of variance covariance mixed models (mBE, mHeNE, mHeCS, mHeUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHt30 <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                          data = conif.30, homoscedastic = FALSE)
 sync(ModHt30, modname = "mBE")
 sync(ModHt30, modname = "mHeUN")
 



