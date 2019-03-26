library(ConsRank)


### Name: FASTcons
### Title: FAST algorithm to find consensus (median) ranking. FAST
###   algorithm to find consensus (median) ranking defined by Amodio,
###   D'Ambrosio and Siciliano (2016). It returns at least one of the
###   solutions. If there are multiple solutions, sometimes it returns all
###   the solutions, sometimes it returns some solutions, always it returns
###   at least one solution.
### Aliases: FASTcons
### Keywords: FAST algorithm

### ** Examples

##data(EMD)
##X=EMD[,1:15]
##Wk=matrix(EMD[,16],nrow=nrow(X))
##CR=FASTcons(X,Wk,maxiter=100)
##These lines produce all the three solutions in less than a minute.

data(sports)
CR=FASTcons(sports,maxiter=10)




