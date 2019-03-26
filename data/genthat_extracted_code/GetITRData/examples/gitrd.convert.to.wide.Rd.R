library(GetITRData)


### Name: gitrd.convert.to.wide
### Title: Converts a dataframe from gitr_GetITRData to the wide format
### Aliases: gitrd.convert.to.wide

### ** Examples


# get example data from RData file
my.f <- system.file('extdata/ExampleReport_Petrobras.RData', package = 'GetITRData')
load(my.f)

df.assets <- df.reports$fr.assets[[1]]
df.assets.wide <- gitrd.convert.to.wide(df.assets)



