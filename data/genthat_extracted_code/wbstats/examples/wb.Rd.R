library(wbstats)


### Name: wb
### Title: Download Data from the World Bank API
### Aliases: wb

### ** Examples

 # GDP at market prices (current US$) for all available countries and regions
 ## No test: 
wb(indicator = "NY.GDP.MKTP.CD", startdate = 2000, enddate = 2016)
## End(No test)

 # GDP and Population in long format for the most recent 20 observations
 ## No test: 
wb(indicator = c("SP.POP.TOTL","NY.GDP.MKTP.CD"), mrv = 20)
## End(No test)

 # GDP and Population in wide format for the most recent 20 observations
 ## No test: 
wb(indicator = c("SP.POP.TOTL","NY.GDP.MKTP.CD"), mrv = 20, return_wide = TRUE)
## End(No test)

 # query using regionID or incomeID
 # High Income Countries and Sub-Saharan Africa (all income levels)
 wb(country = c("HIC", "SSF"), indicator = "NY.GDP.MKTP.CD", startdate = 1985, enddate = 1985)

 # if you do not know when the latest time an indicator is avaiable mrv can help
 wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 1)

 # increase the mrv value to increase the number of maximum number of returns
 wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 35)

 # GDP at market prices (current US$) for only available countries
 ## No test: 
wb(country = "countries_only", indicator = "NY.GDP.MKTP.CD", startdate = 2000, enddate = 2016)
## End(No test)

 # GDP at market prices (current US$) for only available aggregate regions
 ## No test: 
wb(country = "aggregates", indicator = "NY.GDP.MKTP.CD", startdate = 2000, enddate = 2016)
## End(No test)

 # if you want to "fill-in" the values in between actual observations use gapfill = TRUE
 # this highlights a very important difference.
 # all other parameters are the same as above, except gapfill = TRUE
 # and the results are very different
 wb(country = c("IN"), indicator = 'EG.ELC.ACCS.ZS', mrv = 35, gapfill = TRUE)

 # if you want the most recent values within a certain time frame
 wb(country = c("US"), indicator = 'SI.DST.04TH.20', startdate = 1970, enddate = 2000, mrv = 2)

 # without the freq parameter the deafult temporal granularity search is yearly
 # should return the 12 most recent years of data
 wb(country = c("CHN", "IND"), indicator = "DPANUSSPF", mrv = 12)

 # if another frequency is available for that indicator it can be accessed using the freq parameter
 # should return the 12 most recent months of data
 wb(country = c("CHN", "IND"), indicator = "DPANUSSPF", mrv = 12, freq = "M")



