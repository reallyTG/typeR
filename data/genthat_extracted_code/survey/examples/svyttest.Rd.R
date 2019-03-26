library(survey)


### Name: svyttest
### Title: Design-based t-test
### Aliases: svyttest confint.svyttest
### Keywords: survey htest

### ** Examples

data(api)
dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)
tt<-svyttest(enroll~comp.imp, dclus2)
tt
confint(tt, level=0.9)

svyttest(I(api00-api99)~0, dclus2)




