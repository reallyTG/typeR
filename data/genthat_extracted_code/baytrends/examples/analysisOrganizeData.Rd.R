library(baytrends)


### Name: analysisOrganizeData
### Title: Analysis Organization & Data Preparation
### Aliases: analysisOrganizeData

### ** Examples

# run analysis relying on default specifications, examine analySpec for
# default options
dfr <- analysisOrganizeData(dataCensored)
df        <- dfr[["df"]]
analySpec <- dfr[["analySpec"]]

# analyze bottom dissolved oxygen at 2 stations
analySpec <-list()
analySpec$parameterFilt <- c('do')
analySpec$layerFilt     <- c('B')
analySpec$stationFilt   <- c('CB3.3C', 'CB5.4')
dfr <- analysisOrganizeData(dataCensored, analySpec)
df        <- dfr[["df"]]
analySpec <- dfr[["analySpec"]]




