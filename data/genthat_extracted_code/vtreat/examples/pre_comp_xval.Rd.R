library(vtreat)


### Name: pre_comp_xval
### Title: Pre-computed cross-plan (so same split happens each time).
### Aliases: pre_comp_xval

### ** Examples


p1 <- oneWayHoldout(3,NULL,NULL,NULL)
p2 <- pre_comp_xval(3, 3, p1)
p2(3, 3)




