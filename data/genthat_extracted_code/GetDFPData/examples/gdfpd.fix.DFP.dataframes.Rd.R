library(GetDFPData)


### Name: gdfpd.fix.DFP.dataframes
### Title: Fix dataframe for version issues and inflation measures
###   (internal)
### Aliases: gdfpd.fix.DFP.dataframes

### ** Examples

#'
# get example data from RData file
my.f <- system.file('extdata/Example_DFP_Report_Petrobras.RData', package = 'GetDFPData')
load(my.f)

df.assets <- df.reports$fr.assets[[1]]
df.inflation <- gdfpd.get.inflation.data('dollar', do.cache = FALSE)

df.assets.fixed <- gdfpd.fix.DFP.dataframes(df.assets,
                                        inflation.index = 'dollar',
                                        df.inflation = df.inflation)



