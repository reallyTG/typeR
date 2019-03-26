library(distrSim)


### Name: Subsetting-methods
### Title: Subsetting/Indexing methods for SeqDataFrames objects in Package
###   'distrSim'
### Aliases: [-methods [<--methods [,SeqDataFrames-method
###   [<-,SeqDataFrames-method
### Keywords: methods

### ** Examples

s0 <- matrix(1:6,3,2)
d0 <- data.frame(s0)
d1 <- data.frame(s0 + 3)
SF <- SeqDataFrames(d0, d1)
SF[1,2,1]



