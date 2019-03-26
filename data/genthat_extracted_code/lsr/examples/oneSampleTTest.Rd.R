library(lsr)


### Name: oneSampleTTest
### Title: One sample t-test
### Aliases: oneSampleTTest

### ** Examples

likert <- c(3,1,4,1,4,6,7,2,6,6,7)

oneSampleTTest( x = likert, mu = 4 ) 
oneSampleTTest( x = likert, mu = 4, one.sided = "greater" ) 
oneSampleTTest( x = likert, mu = 4, conf.level=.99 ) 

likert <- c(3,NA,4,NA,4,6,7,NA,6,6,7)
oneSampleTTest( x = likert, mu = 4 ) 




