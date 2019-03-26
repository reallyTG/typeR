library(detrendeR)


### Name: RwlInfo
### Title: Computes some common statistics on individual ring-width series.
### Aliases: RwlInfo

### ** Examples


data(co021, package="dplR")
RwlInfo(co021)
RwlInfo(co021, print=FALSE)->co021.info
write(co021.info)



