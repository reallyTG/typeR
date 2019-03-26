library(survey)


### Name: svyquantile
### Title: Quantiles for sample surveys
### Aliases: svyquantile print.svyquantile SE.svyquantile
###   svyquantile.survey.design svyquantile.svyrep.design
### Keywords: univar survey

### ** Examples


  data(api)
  ## population
  quantile(apipop$api00,c(.25,.5,.75))

  ## one-stage cluster sample
  dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
  svyquantile(~api00, dclus1, c(.25,.5,.75),ci=TRUE)
  svyquantile(~api00, dclus1, c(.25,.5,.75),ci=TRUE,interval.type="betaWald")
  svyquantile(~api00, dclus1, c(.25,.5,.75),ci=TRUE,df=NULL)

  dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)
  (qapi<-svyquantile(~api00, dclus1, c(.25,.5,.75),ci=TRUE, interval.type="score"))
  SE(qapi)

  #stratified sample
  dstrat<-svydesign(id=~1, strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
  svyquantile(~api00, dstrat, c(.25,.5,.75),ci=TRUE)

  #stratified sample, replicate weights
  # interval="probability" is necessary for jackknife weights
  rstrat<-as.svrepdesign(dstrat)
  svyquantile(~api00, rstrat, c(.25,.5,.75), interval.type="probability")


  # BRR method
  data(scd)
  repweights<-2*cbind(c(1,0,1,0,1,0), c(1,0,0,1,0,1), c(0,1,1,0,0,1),
              c(0,1,0,1,1,0))
  scdrep<-svrepdesign(data=scd, type="BRR", repweights=repweights)
  svyquantile(~arrests+alive, design=scdrep, quantile=0.5, interval.type="quantile")

 


