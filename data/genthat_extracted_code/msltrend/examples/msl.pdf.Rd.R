library(msltrend)


### Name: msl.pdf
### Title: Pdf plotting options.
### Aliases: msl.pdf

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

# default output, 3 panels, 95% confidence intervals.
msl.pdf(s)
# Check 'File1.pdf' in working directory

# pdf plot time series, 95% confidence intervals.
msl.pdf(s, file_name = 'Series.pdf', type = 2)
# Check 'Series.pdf' file in working directory

# pdf plot instantaneous velocity, 95% confidence intervals.
msl.pdf(s, file_name = 'Velocity.pdf', type = 3)
# Check 'Velocity.pdf' file in working directory

# pdf plot instantaneous acceleration, 99% confidence intervals.
msl.pdf(s, file_name = 'Acceleration.pdf', type = 4, ci = 2)
# Check 'Acceleration.pdf' file in working directory

# default output, 3 panels, 95% confidence intervals.
msl.pdf(t, file_name = 'Forecast.pdf')
# Check 'Forecast.pdf' file in working directory




