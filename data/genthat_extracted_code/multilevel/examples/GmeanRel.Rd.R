library(multilevel)


### Name: GmeanRel
### Title: Group Mean Reliability from an lme model (nlme package)
### Aliases: GmeanRel
### Keywords: attribute

### ** Examples

data(bh1996)
library(nlme)
tmod<-lme(WBEING~1,random=~1|GRP,data=bh1996)
GmeanRel(tmod)



