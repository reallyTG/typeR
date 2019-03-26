library(msltrend)


### Name: msl.forecast
### Title: Projected sea level rise integrated with historical record.
### Aliases: msl.forecast

### ** Examples

# -------------------------------------------------------------------------
# Isolate trend from Baltimore record, filling gaps with spline interpolation,
# 500 iterations and adding 1000 mm of slr to 2100. Use raw 'Balt.csv' data file.
# Note: ordinarily user would call 'File.csv' direct from working directory
# using the following sample code:
# s <- msl.trend('Balt.csv', fillgaps = 3, iter = 500, 'BALTIMORE, USA')
# t <- msl.forecast(s, slr = 1000)
# -------------------------------------------------------------------------

data(s) # msl.trend object from above-mentioned example
data(t) # msl.forecast object from above-mentioned example
str(t) # check structure of msl.forecast object
msl.plot(s, type=2) # check screen output of gapfilling and trend estimate
msl.plot(t, type=2) # check screen output of adding 1000 mm of sea level rise




