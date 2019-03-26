library(msltrend)


### Name: msl.plot
### Title: Screen plotting options.
### Aliases: msl.plot

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
msl.plot(s) # default screen plot output, 3 panels, 95% confidence intervals
msl.plot(s, type = 2) # plot time series, 95% confidence intervals
msl.plot(s, type = 3) # plot instantaneous velocity, 95% confidence intervals
msl.plot(s, type = 4, ci = 2) # plot acceleration, 99% confidence intervals
msl.plot(t) # default screen plot output, 3 panels, 95% confidence intervals
msl.plot(t, type = 2) # plot time series, 95% confidence intervals
msl.plot(t, type = 3) # plot instantaneous velocity, 95% confidence intervals
msl.plot(t, type = 4, ci = 2) # plot acceleration, 99% confidence intervals




