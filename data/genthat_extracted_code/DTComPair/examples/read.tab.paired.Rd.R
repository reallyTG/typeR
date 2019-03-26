library(DTComPair)


### Name: read.tab.paired
### Title: Read in "tab.paired"-Objects
### Aliases: read.tab.paired

### ** Examples

read.t2 <- read.tab.paired(321, 51, 730, 272, 
                           120, 8, 74, 109,
                           testnames=c("Test A", "Test B"))
class(read.t2)
read.t2
acc.paired(read.t2)



