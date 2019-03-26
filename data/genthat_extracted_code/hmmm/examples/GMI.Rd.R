library(hmmm)


### Name: GMI
### Title: function to compute the generalized marginal interactions
###   associated to a hierarchical family of marginal sets
### Aliases: GMI
### Keywords: generalized marginal interactions marginal models

### ** Examples

# joint frequencies for two ordinal variables 
# H: level of happiness on a scale from 1 to 5
# S: level of satisfaction on a scale from 1 to 5

y<-c(50,36,15,15,13,15,84,60,42,
     35,6,26,105,113,57,5,26,62,
     465,334,4,10,34,186,1404)
  
lev<-c(5,5)
marg<-c("g-m","m-g","g-g")
names<-c("H","S")

o<-GMI(cbind(c(y),c(y/sum(y))),marg,lev,names,mflag="m")
o



