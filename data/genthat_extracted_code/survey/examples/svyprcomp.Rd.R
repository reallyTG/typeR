library(survey)


### Name: svyprcomp
### Title: Sampling-weighted principal component analysis
### Aliases: svyprcomp biplot.svyprcomp
### Keywords: survey hplot multivariate

### ** Examples

data(api)
dclus2<-svydesign(id=~dnum+snum, fpc=~fpc1+fpc2, data=apiclus2)

pc <- svyprcomp(~api99+api00+ell+hsg+meals+emer, design=dclus2,scale=TRUE,scores=TRUE)
pc
biplot(pc, xlabs=~dnum, weight="none")

biplot(pc, xlabs=~dnum,max.alpha=1)

biplot(pc, weight="scaled",max.cex=1.5, xlabs=~dnum)




