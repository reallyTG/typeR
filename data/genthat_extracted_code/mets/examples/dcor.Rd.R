library(mets)


### Name: dcor
### Title: summary, tables, and correlations for data frames
### Aliases: dcor dsummary dstr dsubset dquantile dcount dmean dmeansd
###   dscalar deval deval2 dsum dsd

### ** Examples

data("sTRACE",package="timereg")
dt<- sTRACE
dt$time2 <- dt$time^2
dt$wmi2 <- dt$wmi^2
head(dt)

dcor(dt)

dcor(dt,~time+wmi)
dcor(dt,~time+wmi,~vf+chf)
dcor(dt,time+wmi~vf+chf)

dcor(dt,c("time*","wmi*"),~vf+chf)



