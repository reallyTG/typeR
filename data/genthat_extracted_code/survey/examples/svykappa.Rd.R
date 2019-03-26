library(survey)


### Name: svykappa
### Title: Cohen's kappa for agreement
### Aliases: svykappa
### Keywords: survey

### ** Examples

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
svykappa(~comp.imp+sch.wide, dclus1)

dclus1<-update(dclus1, stypecopy=stype)
svykappa(~stype+stypecopy,dclus1)



