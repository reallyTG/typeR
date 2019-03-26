library(wktmo)


### Name: weekToMonth
### Title: Convert weekly data to monthly data
### Aliases: weekToMonth

### ** Examples

# extract data
data(weeklyFlu)
# subset data of interest, e.g. to convert weekly influenza A cases in China
weeklyData <- weeklyFlu$fluA[weeklyFlu$country == "China"]
# convert weekly data to monthly data;
# these two input methods below will return the same results.
monthlyData <- weekToMonth(weeklyData, year = 2010, wkIndex = 1, wkMethod = "ISO")
monthlyData <- weekToMonth(weeklyData, datStart = "04-01-2010", wkMethod = "startDat")



