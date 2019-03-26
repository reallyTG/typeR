library(DendroSync)


### Name: dendro.varcov
### Title: Fit variance-covariance mixed models on tree-ring chronologies
### Aliases: dendro.varcov

### ** Examples

## Calculate variance-covariance models on Iberian Peninsula conifers
 # chronologies using two different grouping strategies.
 # Tree-ring width chronologies are grouped according to taxonomic (i.e. Species)
 # or geographic (i.e. Region) criteria.
 #User-defined homoscedastic or heteroscedastic variances can be fitted.
 data(conifersIP)
 
 #Chop the data from 1960 to 1989.
 conif.30 <- conifersIP[conifersIP$Year>1959 & conifersIP$Year<1990,]
 summary(conif.30$Year)
 
 ##Fit the homoscedastic set of varcov models (mBE, mNE, mCS, mUN)
 # using taxonomic grouping criteria (ie. Species)
 ModHm <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                        data = conif.30, homoscedastic = TRUE)
 
 summary(ModHm)# Class and length of list elements
 ModHm
 ModHm[2]#mNE fitted model results
 
 ##Fit the heteroscedastic set of varcov models (mBE, mHeNE, mHeCS, mHeUN) 
 # using geographic grouping criteria (ie. Region)
 ModHt <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Region", 
                        data = conif.30, homoscedastic = FALSE)
 
 summary(ModHt)# Class and length of list elements
 ModHt
 ModHt[3]#mHeCS fitted model results
       
                   



