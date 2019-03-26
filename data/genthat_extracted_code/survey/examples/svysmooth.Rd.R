library(survey)


### Name: svysmooth
### Title: Scatterplot smoothing and density estimation
### Aliases: svysmooth svysmooth.default plot.svysmooth print.svysmooth
###   lines.svysmooth make.panel.svysmooth
### Keywords: hplot survey

### ** Examples

 data(api)
 dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)

 smth<-svysmooth(api00~api99+ell,dstrat)
 dens<-svysmooth(~api99, dstrat,bandwidth=30)
 dens1<-svysmooth(~api99, dstrat)
 qsmth<-svysmooth(api00~ell,dstrat, quantile=0.75, df=3,method="quantreg")

 plot(smth)
 plot(smth, which="ell",lty=2,ylim=c(500,900))
 lines(qsmth, col="red")

 svyhist(~api99,design=dstrat)
 lines(dens,col="purple",lwd=3)
 lines(dens1, col="forestgreen",lwd=2)

 m<-svyglm(api00~sin(api99/100)+stype, design=dstrat)
 termplot(m, data=model.frame(dstrat), partial.resid=TRUE, se=TRUE,
  smooth=make.panel.svysmooth(dstrat))



