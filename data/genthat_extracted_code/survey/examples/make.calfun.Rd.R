library(survey)


### Name: make.calfun
### Title: Calibration metrics
### Aliases: make.calfun cal.linear cal.raking cal.logit cal.sinh
### Keywords: survey

### ** Examples

str(cal.linear)
cal.linear$Fm1
cal.linear$dF

hellinger <- make.calfun(Fm1=function(u, bounds)  ((1-u/2)^-2)-1,
                    dF= function(u, bounds) (1-u/2)^-3 ,
                    name="hellinger distance")

hellinger

data(api)
dclus1<-svydesign(id=~dnum, weights=~pw, data=apiclus1, fpc=~fpc)

svymean(~api00,calibrate(dclus1, ~api99, pop=c(6194, 3914069),
         calfun=hellinger))

svymean(~api00,calibrate(dclus1, ~api99, pop=c(6194, 3914069),
         calfun=cal.linear))

svymean(~api00,calibrate(dclus1, ~api99, pop=c(6194,3914069),
          calfun=cal.raking))



