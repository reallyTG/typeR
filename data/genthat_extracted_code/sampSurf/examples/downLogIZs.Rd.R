library(sampSurf)


### Name: downLogIZs
### Title: Generate Objects of Class "'downLogIZs'"
### Aliases: downLogIZs
### Keywords: ~kwd1 ~kwd2

### ** Examples

dls = downLogs(4, units='English', logLens=c(10,30))
dls.su = lapply(dls@logs, 'standUpIZ', plotRadius=5)
izs.su = downLogIZs(dls.su)
bbox(izs.su)
plot(izs.su, axes=TRUE)



