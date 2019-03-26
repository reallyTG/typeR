library(caseMatch)


### Name: caseMatch-package
### Title: A package for using matching to select cases from a quantitative
###   data set for further qualitative analysis.
### Aliases: caseMatch-package caseMatch
### Keywords: package

### ** Examples


data(EU)
mvars <- c("socialist","rgdpc","FHc","FHp","trade")
dropvars <- c("countryname","population")

## In this example, I subset to the first 40 obs. to cut run-time
out <- case.match(data=EU[1:40,], id.var="countryname", leaveout.vars=dropvars,
             distance="mahalanobis", case.N=2, greedy.match="pareto", 
             number.of.matches.to.return=10,
             treatment.var="eu", max.variance=TRUE)
out$cases




