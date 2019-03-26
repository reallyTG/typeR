library(oce)


### Name: [[,argo-method
### Title: Extract Something From an Argo Object
### Aliases: [[,argo-method

### ** Examples

data(argo)
# 1. show that dataset has 223 profiles, each with 56 levels
dim(argo[['temperature']])

# 2. show importance of focussing on data flagged 'good'
fivenum(argo[["salinity"]],na.rm=TRUE)
fivenum(argo[["salinity"]][argo[["salinityFlag"]]==1],na.rm=TRUE)




