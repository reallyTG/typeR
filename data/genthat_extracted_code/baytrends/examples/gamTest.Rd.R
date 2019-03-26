library(baytrends)


### Name: gamTest
### Title: Perform GAM analysis
### Aliases: gamTest

### ** Examples

# specify parameter and station to analyze
dep        <- 'secchi'
stat       <- 'CB5.4'
layer      <- 'S'

#Using gamTest
dfr <- analysisOrganizeData (dataCensored)
df        <- dfr[[1]]
analySpec <- dfr[[2]]
gamResult <- gamTest(df, dep, stat, layer, analySpec=analySpec)




