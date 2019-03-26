library(GetITRData)


### Name: gitrd.fix.dataframes
### Title: Fix dataframe for version issues and inflation measures
###   (internal)
### Aliases: gitrd.fix.dataframes

### ** Examples

#'
# get example data from RData file
my.f <- system.file('extdata/ExampleReport_Petrobras.RData', package = 'GetITRData')
load(my.f)

df.assets <- df.reports$fr.assets[[1]]

df.assets.fixed <- gitrd.fix.dataframes(df.assets,
                                        inflation.index = 'none',
                                        df.inflation = data.frame())



