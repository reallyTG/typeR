library(pscl)


### Name: nj07
### Title: rollcall object, National Journal key votes of 2007
### Aliases: nj07
### Keywords: datasets

### ** Examples

require(pscl)
data(nj07)
is(nj07,"rollcall")    ## TRUE
nj07                   ## print method for class rollcall
names(nj07)
names(nj07$vote.data)
table(nj07$vote.data$policyArea)
summary(nj07)          ## summary method
summary(nj07,verbose=TRUE)



