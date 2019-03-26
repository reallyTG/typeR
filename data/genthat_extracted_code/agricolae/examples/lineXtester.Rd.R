library(agricolae)


### Name: lineXtester
### Title: Line x Tester Analysis
### Aliases: lineXtester
### Keywords: models

### ** Examples

# see structure line by testers
library(agricolae)
# example 1
data(heterosis)
site1<-subset(heterosis,heterosis[,1]==1)
output1<-with(site1,lineXtester(Replication, Female, Male, v2))
# example 2
data(LxT)
str(LxT)
output2<-with(LxT,lineXtester(replication, line, tester, yield))



