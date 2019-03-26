library(conjoint)


### Name: Conjoint
### Title: Function Conjoint sums up the main results of conjoint analysis
### Aliases: Conjoint
### Keywords: multivariate

### ** Examples


#Example 1
library(conjoint)
data(ice)
print("Preferences of all respondents (preferences as ranking data):")
Conjoint(ipref,iprof,ilevn,y.type="rank")

#Example 2
library(conjoint)
data(ice)
ipref=caRankToScore(ipref)
print("Preferences of all respondents (preferences converted into rating data):")
Conjoint(ipref,iprof,ilevn,y.type="score")

#Example 3
library(conjoint)
data(journey)
print("Preferences of all respondents (preferences as default - rating data):")
Conjoint(jpref,jprof,jlevn)

#Example 4
library(conjoint)
data(tea)
print("Preferences of all respondents (preferences as rating data):")
Conjoint(tprefm,tprof,tlevn,y.type="score")

#Example 5
library(conjoint)
data(tea)
print("Preferences of first respondent (preferences as default - rating data):")
Conjoint(tprefm[1,],tprof,tlevn)

#Example 6
library(conjoint)
data(tea)
print("Preferences of group of 5 respondents (preferences as rating data):")
Conjoint(tprefm[11:15,],tprof,tlevn,y.type="score")



