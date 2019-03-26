library(survey)


### Name: mu284
### Title: Two-stage sample from MU284
### Aliases: mu284
### Keywords: datasets

### ** Examples

data(mu284)
(dmu284<-svydesign(id=~id1+id2,fpc=~n1+n2, data=mu284))
(ytotal<-svytotal(~y1, dmu284))
vcov(ytotal)



