library(jstable)


### Name: svyregress.display
### Title: svyregress.display: table for svyglm.object
### Aliases: svyregress.display

### ** Examples

 library(survey);data(api)
 apistrat$tt = c(rep(1, 20), rep(0, nrow(apistrat) -20))
 dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
 ds <- svyglm(api00~ell+meals+cname+mobility, design=dstrat)
 ds2 <- svyglm(tt~ell+meals+cname+mobility, design=dstrat, family = quasibinomial())
 svyregress.display(ds)
 svyregress.display(ds2)



