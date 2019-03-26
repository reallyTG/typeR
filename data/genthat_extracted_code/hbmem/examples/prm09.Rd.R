library(hbmem)


### Name: prm09
### Title: PRM09 Data
### Aliases: prm09
### Keywords: datasets

### ** Examples

library(hbmem)
data(prm09)
table(prm09$resp,prm09$cond)
#Turn it into data suitable for
#analysis with HBMEM functions:
newdat=prm09
newdat$Scond=newdat$cond
newdat$cond=0
summary(newdat)



