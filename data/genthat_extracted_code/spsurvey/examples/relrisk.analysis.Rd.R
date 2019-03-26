library(spsurvey)


### Name: relrisk.analysis
### Title: Relative Risk Analysis for Probability Survey Data
### Aliases: relrisk.analysis
### Keywords: survey survival

### ** Examples

mysiteID <- paste("Site", 1:100, sep="")
mysites <- data.frame(siteID=mysiteID, Active=rep(TRUE, 100))
mysubpop <- data.frame(siteID=mysiteID, All.Sites=rep("All Sites", 100),
  Resource.Class=rep(c("Agr", "Forest"), c(55,45)))
mydesign <- data.frame(siteID=mysiteID, wgt=runif(100, 10, 100),
  xcoord=runif(100), ycoord=runif(100), stratum=rep(c("Stratum1",
  "Stratum2"), 50))
mydata.rr <- data.frame(siteID=mysiteID, RespVar1=sample(c("Poor", "Good"),
  100, replace=TRUE), RespVar2=sample(c("Poor", "Good"), 100, replace=TRUE),
  StressVar=sample(c("Poor", "Good"), 100, replace=TRUE), wgt=runif(100, 10,
  100))
relrisk.analysis(sites=mysites, subpop=mysubpop, design=mydesign,
  data.rr=mydata.rr, response.var=c("RespVar1", "RespVar2"),
  stressor.var=rep("StressVar", 2))



