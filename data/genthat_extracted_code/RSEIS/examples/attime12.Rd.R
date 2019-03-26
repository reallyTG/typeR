library(RSEIS)


### Name: attime12
### Title: Epoch Time Window
### Aliases: attime12
### Keywords: misc

### ** Examples


j1  <-  list(yr = 2005, jd= 214 , hr= 7 , mi= 1 ,sec= 0.5235)
j2  <-  list(yr=2005, jd= 214 , hr= 7 , mi= 1 ,sec= 0.5235+6)

at <-  attime12(j1, t2=j1, origyr=2005, pre=100, post=100)

### given an RSEIS format list
data(GH)
AT =  SEISNtime(GH)
ats = attime12(AT[[1]], t2 = AT[[2]],
   origyr =AT[[1]]$yr , pre = 0, post= 0)





