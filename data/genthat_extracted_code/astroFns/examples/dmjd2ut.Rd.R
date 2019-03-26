library(astroFns)


### Name: dmjd2ut
### Title: DMJD to UT
### Aliases: dmjd2ut
### Keywords: chron

### ** Examples

dmjd2ut(56951.54183613)

sd <- getOption('digits.secs')
dmjd2ut(ut2dmjd(2010, 1, 5, 2, 34, 17.8115))
options('digits.secs' = 3)
dmjd2ut(ut2dmjd(2015, 1, 5, 2, 34, 17.8115))
options('digits.secs' = sd)

dmjd2ut(ut2dmjd(2015, 1, 5, 2, 34, 17.8115), tz='CET')
dmjd2ut(ut2dmjd(2015, 8, 5, 2, 34, 17.8115), tz='CET')
dmjd2ut(ut2dmjd(2015, 1, 5, 2, 34, 17.8115), tz='EST5EDT')
dmjd2ut(ut2dmjd(2015, 8, 5, 2, 34, 17.8115), tz='EST5EDT')

dmjd2ut(ymd2jd(2001, 1, 1) - 2400000.5)



