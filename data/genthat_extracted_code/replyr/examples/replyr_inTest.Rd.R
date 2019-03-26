library(replyr)


### Name: replyr_inTest
### Title: Product a column noting if another columns values are in a given
###   set.
### Aliases: replyr_inTest

### ** Examples


values <- c('a','c')
d <- data.frame(x=c('a','a','b',NA,'c','c'),y=1:6,
                stringsAsFactors=FALSE)
replyr_inTest(d,'x',values,'match')




