library(braidrm)


### Name: getBRAIDbootstrap
### Title: Bootstrap BRAID Parameter Confidence Intervals
### Aliases: getBRAIDbootstrap
### Keywords: regression

### ** Examples

data(es8olatmz)
## Don't show: 
es8olatmz <- es8olatmz[(es8olatmz$plate==8&grepl("[AB]",es8olatmz$well))|es8olatmz$plate==9|
							(es8olatmz$plate==27&grepl("(01|02)",es8olatmz$well)),]
## End(Don't show)
brd <- braidrm(act~conc1+conc2,es8olatmz,getCIs=FALSE,fixed=c(NA,NA,NA,NA,1,NA,NA,-4,-4,-4))
summary(getBRAIDbootstrap(brd))
## Not run: summary(getBRAIDbootstrap(brd,ciLevs=c(0.05,0.95)))



