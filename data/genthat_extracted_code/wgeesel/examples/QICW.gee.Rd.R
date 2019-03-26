library(wgeesel)


### Name: QICW.gee
### Title: QICWr and QICWp for WGEE
### Aliases: QICW.gee
### Keywords: QICW wgee

### ** Examples

data(imps)

### variable selection by QICWr, not rum###
#fit <- wgee(IMPS79 ~ Drug+Sex+Time, mismodel= R ~ Drug+Time, data=imps,
##           id=imps$ID, family="gaussian", corstr="exchangeable")
##QICW.gee(fit)

#fit <- wgee(IMPS79 ~ Drug+Sex+Time+Time:Sex+Time:Drug, mismodel= R ~ Drug+Time,
#        data=imps, id=imps$ID, family="gaussian", corstr="exchangeable")
##QICW.gee(fit)



