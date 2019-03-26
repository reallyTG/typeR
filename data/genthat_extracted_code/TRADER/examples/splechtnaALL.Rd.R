library(TRADER)


### Name: splechtnaALL
### Title: Overal function for Splechtna et al. 2005 type of releases
###   analysis.
### Aliases: splechtnaALL
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(relData)
splechtnaALL(relData1)
splechtnaALL(relData1,length=3,buffer=4,storedev=pdf,boundary=function(x) {5.0067*exp(-0.664*x)} )



