library(timetools)


### Name: changeSupport
### Title: Function to change time support of TimeIntervalDataFrame
### Aliases: changeSupport
###   changeSupport,TimeIntervalDataFrame,character,numeric-method
###   changeSupport,TimeIntervalDataFrame,POSIXctp,numeric-method
###   changeSupport,TimeIntervalDataFrame,TimeIntervalDataFrame,numeric-method

### ** Examples

ti3 <- TimeIntervalDataFrame (
       c('2010-01-01', '2010-01-02', '2010-01-04'), NULL,
       'UTC', data.frame(ex3=c(6, 1.5)))

# weighted mean over a period of 3 days with at least 75% of
# coverage (NA is retunr if not)
ti3
d <- POSIXctp(unit='day')
changeSupport (ti3, 3L*d, 0.75)

ti4 <- TimeIntervalDataFrame (
	c('2010-01-01', '2010-01-02', '2010-01-04',
	  '2010-01-07', '2010-01-09', '2010-01-10'), NULL,
         'UTC', data.frame(ex4=c(6, 1.5, 5, 3, NA)))

# weighted mean over a period of 3 days with at least 75% of
# coverage (NA is retunr if not) or 50%
ti4
changeSupport (ti4, 3L*d, 0.75)
changeSupport (ti4, 3L*d, 0.5)

# use of split.from
ti1 <- RegularTimeIntervalDataFrame('2011-01-01', '2011-02-01', 'hour')
ti1$value <- 1:nrow(ti1)
# we can calculate sliding mean over periods of 24 hours.
# first lets build the corresponding TimeIntervalDataFrame
ti2 <- RegularTimeIntervalDataFrame('2011-01-01', '2011-02-01', 'hour', 'day')
# if we try to 'project' ti1 over ti2 it won't work :
summary (changeSupport (ti1[1:200,], ti2[1:200,], 0))
# all data are NA because 'spliting' is not enabled. Let's enable it :
summary (changeSupport (ti1[1:200,], ti2[1:200,], 0, split.from=TRUE))



