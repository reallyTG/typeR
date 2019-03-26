library(DendroSync)


### Name: sync.trend
### Title: Calculate temporal trends of synchrony
### Aliases: sync.trend

### ** Examples

## Calculate  temporal trends of spatial synchrony for conifersIP data:
 data(conifersIP)
 
 ##Fit the null.model temporal trend (mBE) 
 #using taxonomic grouping criteria (i.e. Species)
 mBE.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                          data = conifersIP, null.mod = TRUE, window = 30, lag = 5)
 
 mBE.trend# it returns a data.frame

## Not run: 
##D  
##D  ##Fit homoscedastic within-group trends (mBE, mNE, mCS, mUN) 
##D  # using geographic grouping criteria (i.e. Region)
##D  geo.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Region", 
##D                          data = conifersIP, window = 30, lag = 5, 
##D                          null.mod = FALSE, homoscedastic = TRUE)
##D                          
##D  geo.trend#a data.frame with varGroup syncrony for each time window.
##D  
##D  ##Fit heteroscedastic between-group trends (mBE, mHeNE, mHeCS, mHeUN) 
##D  #using geographic grouping criteria (i.e. Region) and BIC
##D  geo.het.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Region", 
##D                              data = conifersIP, window = 30, lag = 5, null.mod = FALSE, 
##D                              selection.method = c("BIC"), homoscedastic = FALSE, 
##D                              between.group = TRUE)
##D  geo.het.trend
##D  
##D  ##Fit homoscedastic and heterocedastic within-group trends
##D  # using taxonomic grouping criteria (i.e. Species) and BIC
##D  geo.tot.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Species", 
##D                              data = conifersIP, window = 30, lag = 5, 
##D                              selection.method = c("BIC"), all.mod = TRUE)
##D  geo.tot.trend
##D  
## End(Not run)




