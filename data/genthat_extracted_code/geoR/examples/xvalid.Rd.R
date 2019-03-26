library(geoR)


### Name: xvalid
### Title: Cross-validation by kriging
### Aliases: xvalid summary.xvalid print.summary.xvalid
### Keywords: spatial

### ** Examples

#
# Maximum likelihood estimation
#
s100.ml <- likfit(s100, ini = c(.5, .5), fix.nug = TRUE)
#
# Weighted least squares estimation
#
s100.var <- variog(s100, max.dist = 1)
s100.wls <- variofit(s100.var, ini = c(.5, .5), fix.nug = TRUE)
#
# Now, performing cross-validation without reestimating the model
#
s100.xv.ml <- xvalid(s100, model = s100.ml)
s100.xv.wls <- xvalid(s100, model = s100.wls)
##
## Plotting results
##
par.ori <- par(no.readonly = TRUE)
##
par(mfcol=c(5,2), mar=c(2.3,2.3,.5,.5), mgp=c(1.3, .6, 0))
plot(s100.xv.ml)
par(mfcol=c(5,2))
plot(s100.xv.wls)
##
par(par.ori)
#
## Don't show: 
set.seed(234)
data(s100)
  vr <- variog(s100, max.dist=1)
  ## OLS#
  o1 <- variofit(vr, ini=c(.5, .5), fix.nug=TRUE, wei="equal")
  xvo1 <- xvalid(s100, model=o1, variog.obj=vr, loc=sample(1:100,5))
  o2 <- variofit(vr, ini=c(.5, .5), wei = "equal")
  xvo2 <- xvalid(s100, model=o2, variog.obj=vr, loc=sample(1:100,5))
  o3 <- variofit(vr, ini=c(.5, .5), fix.nug=TRUE, fix.kappa = FALSE, wei = "equal")
  xvo3 <- xvalid(s100, model=o3, variog.obj=vr, loc=sample(1:100,5))
  #o4 <- variofit(vr, ini=c(.5, .5), fix.kappa = FALSE, wei = "equal")
  #xvo4 <- xvalid(s100, model=o4, variog.obj=vr, loc=sample(1:100,5))
  ## WLS
  w1 <- variofit(vr, ini=c(.5, .5), fix.nug=TRUE)
  xvw1 <- xvalid(s100, model=w1, variog.obj=vr, loc=sample(1:100,5))
  w2 <- variofit(vr, ini=c(.5, .5))
  xvw2 <- xvalid(s100, model=w2, variog.obj=vr, loc=sample(1:100,5))
  w3 <- variofit(vr, ini=c(.5, .5), fix.nug=TRUE, fix.kappa = FALSE)
  xvw3 <- xvalid(s100, model=w3, variog.obj=vr, loc=sample(1:100,5))
  w4 <- variofit(vr, ini=c(.5, .5), fix.kappa = FALSE)
  xvw4 <- xvalid(s100, model=w4, variog.obj=vr, loc=sample(1:100,5))
  # ML
  m1 <- likfit(s100, ini=c(.5,.5), fix.nug=FALSE, cov.model="mat", kappa=1)
  xvm1 <- xvalid(s100, model=m1, loc=sample(1:100,5))
  ap <- grf(10, cov.pars=c(1, .25))
  xvm2 <- xvalid(s100, model=m1, locations.xvalid=ap$coords, data.xvalid=ap$data)
  bor <- s100$coords[chull(s100$coords),]
  par(mfcol=c(5,2),mar=c(3,3,1,0),mgp=c(2,.5,0))  
  plot(xvm2, borders=bor)
  # RML
  rm1 <- likfit(s100, ini=c(.5,.5), fix.nug=FALSE, met = "REML", cov.model="mat", kappa=1)
  xvrm1 <- xvalid(s100, model=m1, loc=sample(1:100,5))
## End(Don't show)



