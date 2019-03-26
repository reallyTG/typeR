library(rcompanion)


### Name: percentileTest
### Title: Test of percentiles by permutation test
### Aliases: percentileTest

### ** Examples

data(BrendonSmall)
percentileTest(Sodium ~ Instructor, 
               data=BrendonSmall, 
               test="median")

percentileTest(Sodium ~ Instructor, 
               data=BrendonSmall, 
               test="percentile", 
               tau = 0.75)

percentileTest(Sodium ~ Instructor, 
               data=BrendonSmall, 
               test="proportion", 
               threshold = 1300)
               



