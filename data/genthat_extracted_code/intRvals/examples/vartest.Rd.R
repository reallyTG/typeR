library(intRvals)


### Name: vartest
### Title: F Test to compare two variances of objects of class 'intRvals'
### Aliases: vartest

### ** Examples

data(goosedrop)
dr=estinterval(goosedrop$interval)
# split the interval data into two periods
data.beforeMay=goosedrop[goosedrop$date<as.POSIXct('2013-05-01'),]
data.afterMay=goosedrop[goosedrop$date>as.POSIXct('2013-05-01'),]
dr.beforeMay=estinterval(data.beforeMay$interval)
dr.afterMay=estinterval(data.afterMay$interval)
# perform an F test
vartest(dr.beforeMay,dr.afterMay)




