library(SEERaBomb)


### Name: getPY
### Title: Get tsd interval PY
### Aliases: getPY
### Keywords: internal

### ** Examples

library(SEERaBomb)
brks=c(0,0.25,1,3,6)  
(binS=levels(cut(brks+0.1,breaks=c(brks,100)))) #make a vector of intervals 
survTimes=c(8,16,1.5,3.7)
getPY(survTimes,binS[1],binS,brks)# all contribute 0.25 to first interval 
getPY(survTimes,binS[4],binS,brks)# 3rd and 4th survivals contribute 0 and 0.7 to (3,6]
getPY(survTimes,binS[5],binS,brks)# 1st and 2nd survival contribute 2 and 10 years to (6,100]



