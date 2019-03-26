library(msltrend)


### Name: msl.trend
### Title: Isolate trend component from mean sea level records.
### Aliases: msl.trend

### ** Examples

# -------------------------------------------------------------------------
# Isolate trend from Baltimore record, filling gaps with spline interpolation and
# 500 iterations. Use raw 'Balt.csv' data file. Note: ordinarily user would call
# 'File.csv' direct from working directory using the following sample code:
# s <- msl.trend('Balt.csv', fillgaps = 3, iter = 500, 'BALTIMORE, USA') # DONT RUN
# -------------------------------------------------------------------------

data(s) # msl.trend object from above-mentioned example
str(s) # check structure of msl.trend object
msl.plot(s, type=2) # check screen output of gapfilling and trend estimate





