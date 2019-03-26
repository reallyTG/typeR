library(braidrm)


### Name: calcBRAIDconfint
### Title: Calculate General BRAID Confidence Intervals
### Aliases: calcBRAIDconfint
### Keywords: regression

### ** Examples

data(es8olatmz)
## Don't show: 
es8olatmz <- es8olatmz[(es8olatmz$plate==8&grepl("[AB]",es8olatmz$well))|es8olatmz$plate==9|
							(es8olatmz$plate==27&grepl("(01|02)",es8olatmz$well)),]
## End(Don't show)
brd <- braidrm(act~conc1+conc2,es8olatmz,fixed=c(NA,NA,NA,NA,1,NA,NA,-4,-4,-4))
potci <- calcBRAIDconfint(brd,function(parv) invertBRAIDrsm(-1,DA=10^-7,parv=parv))
## Not run: 
##D pconc <- exp(seq(log(10^-6),log(10^-3),length=100))
##D effci <- calcBRAIDconfint(brd,function(parv) evalBRAIDrsm(10^-7,pconc,parv))
## End(Not run)



