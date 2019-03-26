library(DendroSync)


### Name: sync.trend.plot
### Title: Plot temporal trends of synchrony
### Aliases: sync.trend.plot

### ** Examples

## Calculate temporal trends of synchrony for conifersIP data:
 data(conifersIP)
 
 ##Fit the null.model temporal trend (mBE) using taxonomic grouping criteria (i.e. Species)
 mBE.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Species", 
                          data = conifersIP, null.mod = TRUE, window = 30, lag = 5)
 
 mBE.trend# it returns a data.frame
 sync.trend.plot(mBE.trend)# Broad evaluation synchrony linechart

## Not run: 
##D  
##D  ##Fit homoscedastic within-group trends (mBE, mNE, mCS, mUN) 
##D  # using geographic grouping criteria (i.e. Region)
##D  geo.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Region", 
##D                          data = conifersIP, window = 30, lag = 5, 
##D                          null.mod = FALSE, homoscedastic = TRUE)
##D  
##D  geo.trend#a data.frame with varGroup synchrony for each time window.
##D  sync.trend.plot(geo.trend)#Selected heteroscedastic between-group trends by AIC
##D  
##D  ##Fit heteroscedastic betwen-group trends (mBE, mHeNE, mHeCS, mHeUN) 
##D  # using geographic grouping criteria (i.e. Region) and AICc
##D  geo.het.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Region", 
##D                     data = conifersIP, window = 30, lag = 5, null.mod = FALSE, 
##D                     selection.method = c("AICc"), homoscedastic = FALSE, between.group = TRUE)
##D  
##D  geo.het.trend
##D  sync.trend.plot(geo.het.trend)#Selected heteroscedastic between-group trends by AICc
##D  
##D  ##Fit homoscedastic and heteroscedastic within-group trends 
##D  # using taxonomic grouping criteria (i.e. Species) and BIC
##D  geo.tot.trend <- sync.trend(TRW ~ Code, varTime = "Year", varGroup = "Species", 
##D                     data = conifersIP, window = 30, lag = 5, selection.method = c("BIC"),
##D                     null.mod = F, all.mod = TRUE)
##D  geo.tot.trend
##D  #Selected homoscedastic and heteroscedastic within-group trends by BIC
##D  sync.trend.plot(geo.tot.trend)
##D  
## End(Not run)
 




