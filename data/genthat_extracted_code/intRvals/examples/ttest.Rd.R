library(intRvals)


### Name: ttest
### Title: Student's t-test to compare two means of objects of class
###   'intRvals'
### Aliases: ttest

### ** Examples

data(goosedrop)
dr=estinterval(goosedrop$interval)
# perform a one-sample t-test
ttest(dr,mu=200)  #> FALSE, true mean not equal to 200
# two sample t-test
data.beforeMay=goosedrop[goosedrop$date<as.POSIXct('2013-05-01'),]
data.afterMay=goosedrop[goosedrop$date>as.POSIXct('2013-05-01'),]
dr.beforeMay=estinterval(data.beforeMay$interval)
dr.afterMay=estinterval(data.afterMay$interval)
ttest(dr.beforeMay,dr.afterMay)




