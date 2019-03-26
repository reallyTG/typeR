library(DendroSync)


### Name: mod.table
### Title: Function to calculate goodness-of-fit statistics for
###   variance-covariance models
### Aliases: mod.table

### ** Examples

## Compare homoscedastic variance-covariance models on Iberian Peninsula
 # conifer ring chronologies using taxonomic grouping criteria (i.e. Species).
 data(conifersIP)
 ModHmSp <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                          data = conifersIP, homoscedastic = TRUE)
 
 mod.table(ModHmSp)# a data.frame containing information criterion values

 ## Compare homoscedastic variance-covariance models on Iberian Peninsula conifers
 # ring chronologies using geographic criteria (ie. Region).
 ModHmGoe <- dendro.varcov(TRW ~ Code, varTime = "Year", varGroup = "Region", 
                           data = conifersIP, homoscedastic = TRUE)
 
 mod.table(ModHmGoe)




