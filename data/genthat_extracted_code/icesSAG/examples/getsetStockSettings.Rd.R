library(icesSAG)


### Name: getsetSAGSettingsForAStock
### Title: Get and Set SAG Chart Settings
### Aliases: getsetSAGSettingsForAStock getSAGSettingsForAStock
###   setSAGSettingForAStock

### ** Examples

## Not run: 
##D key <- findAssessmentKey("cod.21.1", 2017)
##D graphs <- getSAGGraphs(key[1])
##D plot(graphs)
##D getSAGSettingsForAStock(key [1])
##D chart1 <- getLandingsGraph(key [1])
##D setSAGSettingForAStock(key [2], 1, 1, "Catches of cod.21.1 in 2017",
##D FALSE)
##D setSAGSettingForAStock(key [2], 1, 11, 10,
##D FALSE)
##D plot(chart1)
##D chart2 <- getSpawningStockBiomassGraph(key [1])
##D plot(chart2)
##D setSAGSettingForAStock(key [1], 4, 1, "SSB of cod.21.1 in 2017",
##D FALSE)
##D plot(chart2)
## End(Not run)




