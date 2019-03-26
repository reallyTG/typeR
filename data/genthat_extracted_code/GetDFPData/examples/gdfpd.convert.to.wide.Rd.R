library(GetDFPData)


### Name: gdfpd.convert.to.wide
### Title: Converts a dataframe from gdfpd_GetDFPData to the wide format
### Aliases: gdfpd.convert.to.wide

### ** Examples


# get example data from RData file
my.f <- system.file('extdata/Example_DFP_Report_Petrobras.RData', package = 'GetDFPData')
load(my.f)

df.assets <- df.reports$fr.assets[[1]]
df.assets.wide <- gdfpd.convert.to.wide(df.assets)



