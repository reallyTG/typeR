## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(cache=FALSE)
# note that setting this to true causes problems with R CMD CHECK

## ------------------------------------------------------------------------
library(meteR)
data(arth)
dim(arth)
head(arth)

## ------------------------------------------------------------------------
esf1 <- meteESF(spp=arth$spp,
                abund=arth$count,
                power=arth$mass^(3/4),
                minE=min(arth$mass^(3/4)))
esf1
str(esf1)

## ------------------------------------------------------------------------
sad1 <- sad(esf1)
sad1

## ------------------------------------------------------------------------
sad1$r(20)
sad1$q(seq(0,1,length=10))

## ----sad_plot,fig.width=6.5, fig.cap="Different ways of plotting the SAD"----
par(mfrow=c(1,2))
plot(sad1, ptype='rad', log='y')
plot(sad1, ptype='cdf', log='x')

## ---- fig.width=5, fig.cap="Likelihood-based z-score."-------------------
#== calculate the liklihood of the data, given the fitted model
logLik(sad1)
#== randomly generate 100 data sets from the fitted distribution and calculate
#== the z-score of the data w.r.t. these simulations
llz <- logLikZ(sad1, nrep=100, return.sim=TRUE)
llz$z
#== plot the distributions
plot(density(llz$sim, from=0),
     xlim=range(c(llz$sim,llz$z)),
     xlab='Scaled log(likelihood)',col='red')
#== add 95% quantile region
abline(v=quantile(llz$sim, 0.95), col='red')
#== add observed likelihood
abline(v=llz$z,lty=2)
legend('top',legend=c('data','simulated from METE'),
       col=c('black','red'), lty=c(2, 1), bg='white') 

## ------------------------------------------------------------------------
AIC(sad1)

## ------------------------------------------------------------------------
#== calculate the residuals from the fitted distribution
head(residuals(sad1))
head(residuals(sad1, type='cumulative', relative=FALSE))
#== calculate the mean-squared error
mse(sad1, type='rank', relative=FALSE)
#== randomly generate 100 data sets from the fitted distribution and calculate
#== the z-score of the data w.r.t. these simulations
msez.rank <- mseZ(sad1, nrep=100, return.sim=TRUE, type='rank')
msez.rank$z
#== plot the distributions
plot(density(msez.rank$sim),
     xlim=c(0.05, 10),
     xlab='Scaled mean squared error',col='red', log='x')
#== add 95% quantile region
abline(v=quantile(msez.rank$sim, 0.95), col='red')
#== add observed likelihood
abline(v=msez.rank$z,lty=2)
legend('top',legend=c('data','simulated from METE'),
       col=c('black','red'), lty=c(2 ,1),bg='white') 

## ----fig.width=7, fig.cap="Different ways of plotting the IPD"-----------
ipd1 <- ipd(esf1)
ipd1
str(ipd1) # analogous structure to sad1 above
ipd1$r(8) # random number generation from fitted distribution

par(mfrow=c(1,2))
plot(ipd1, ptype='cdf', log='x')
plot(ipd1, ptype='rad', log='y')

## ----fig.width=5, fig.cap="Likelihood-based z-score."--------------------
head(residuals(ipd1))
logLik(ipd1)
logLikZ(ipd1, nrep=100)
llz <- logLikZ(ipd1, nrep=100, return.sim=TRUE)
plot(density(llz$sim),xlim=range(c(llz$sim,llz$obs)),xlab='log(likelihood)',col='red')
abline(v=llz$obs,lty=2)
llz$z
legend('top',legend=c('data','simulated\nfrom METE'),col=c('black','red'),
       lty=c(1,1),bty='n') 


## ----fig.width=5, fig.cap="Mean squared error-based z-score."------------
mse(ipd1, type='rank', relative=FALSE)
mseZ <- mseZ(ipd1, nrep=100, return.sim=TRUE)
mseZ$z
plot(density(mseZ$sim),xlim=range(c(mseZ$sim,mseZ$obs)),xlab='mse',col='red')
abline(v=mseZ$obs,lty=2)
legend('top',legend=c('data','simulated\nfrom METE'),col=c('black','red'),
       lty=c(1,1),bty='n') 

## ----fig.width=5, fig.cap="Distribution of metabolic rates of individuals in a species with $n$ individuals"----
sipd1 <- sipd(esf1, sppID=27)
plot(sipd1, log='x',ylim=c(0,1))

## sipd based on total abundance of a hypothetical species
sipd2 <- sipd(esf1, n=25)

## ----fig.width=5, fig.cap="Distribution of metabolic rates of individuals in a species with $n$ individuals"----
spd1 <- spd(esf1)
plot(spd1, log='x')

## ----fig.width=5, fig.cap="Relationship between abundance and mean metabolic rate"----
ebar1 <- ebar(esf1)
plot(ebar1)

## ------------------------------------------------------------------------
data(anbo)
head(anbo)
esf2 <- meteESF(spp=anbo$spp,
             abund=anbo$count)
str(esf2)

## ----fig.width=7,fig.cap="Different ways of plotting the SAD for the anbo data."----
(sad2=sad(esf2))
par(mfrow=c(1,2))
plot(sad2, ptype='rad')
plot(sad2, ptype='cdf')

## ----fig.width=7,fig.cap="SSAD for the anbo data."-----------------------
## note we are calculating SSF for the species crcr
pi1 <- meteSSF(anbo$spp, 'crcr', anbo$count, row=anbo$row, col=anbo$column, A=1, A0=16)
pi1
plot(ssad(pi1))

## ----fig.width=7,fig.cap="SSAD for A=2."---------------------------------
pi2 <- meteSSF(anbo$spp, 'crcr', anbo$count, row=anbo$row, col=anbo$column, A=2, A0=16)
pi2
plot(ssad(pi2)) # theory is not looking too good for this case

## ----fig.width=7,fig.cap="SSAD for simulated x,y anbo data."-------------
## jitter abundance records within each cell
anbo$x <- runif(nrow(anbo), 0, 1) + anbo$column
anbo$y <- runif(nrow(anbo), 0, 1) + anbo$row

pi3 <- meteSSF(anbo$spp, 'crcr', anbo$count, x=anbo$x, y=anbo$y, A=1, A0=16)
plot(ssad(pi3)) # the plot has naturally changed slightly due to the jittering

## ----fig.width=7,fig.cap="The SAR (black) and EAR (blue) for the anbo data."----
## first the direct method
anbo.esf <- meteESF(spp=anbo$spp, abund=anbo$count)
anbo.thr.downscale <- downscaleSAR(anbo.esf, 2^(seq(-3, 4, length=17)), 16)
anbo.thr.downscale
anbo.thr.downscaleEAR <- downscaleSAR(anbo.esf, 2^(seq(-3, 4, length=17)), 16, EAR=TRUE)

## upscaling
anbo.thr.upscale <- upscaleSAR(anbo.esf, 16, 2^6)

## plotting
plot(anbo.thr.downscale, xlim=c(1, 2^6), ylim=c(0, 35))
plot(anbo.thr.downscaleEAR, col='blue', add=TRUE)
plot(anbo.thr.upscale, col='red', add=TRUE)

## ----fig.width=7,fig.cap="Comparing SAR with data."----------------------
anbo.sar <- meteSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
anbo.sar
plot(anbo.sar, log='xy')

## ------------------------------------------------------------------------
anbo.sar.sim <- meteSAR(anbo$spp, anbo$count, x=anbo$x, y=anbo$x, Amin=1, A0=16)
anbo.sar.sim

## ----fig.width=7---------------------------------------------------------
## empirical SAR and EAR
anbo.obs.sar <- empiricalSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
plot(anbo.obs.sar)

anbo.obs.ear <- empiricalSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16, EAR=TRUE)
plot(anbo.obs.ear)

## ----fig.width=7---------------------------------------------------------
esf3 <- meteESF(N0=4000, S0=50, E0=1e5, minE=1)
sad3 <- sad(esf3)
ipd3 <- ipd(esf3)
par(mfrow=c(1,2))
plot(sad3)
plot(ipd3)

## ----fig.width=7---------------------------------------------------------
## theoretical SARs from state variables only
thr.downscale <- downscaleSAR(meteESF(S0=40, N0=400), 2^seq(-1, 4, by=0.25), 16)
thr.downscaleEAR <- downscaleSAR(meteESF(S0=40, N0=400), 2^seq(-1, 4, by=0.25), 16, EAR=TRUE)
plot(thr.downscale, ylim=c(0, 40), col='red')
plot(thr.downscaleEAR, add=TRUE, col='blue')

## ----fig.width=7---------------------------------------------------------
thr.upscale <- upscaleSAR(meteESF(S0=40, N0=400), 2^(-1:4), 16)

## ----fig.width=7---------------------------------------------------------
#N0s=c(50,100,200,400,800,1600,3200,6400)
#esf4=sad4=ipd4=vector('list',8)
#for(i in 1:length(N0s)){
#  esf4[[i]]=meteESF(N0=N0s[i],S0=50,E0=1e5,minE=1)
#  sad4[[i]]=sad(esf4[[i]])
#  ipd4[[i]]=ipd(esf4[[i]])
#}

#par(mfrow=c(1,2))
#plot(sad4[[i]])
#for(i in 1:length(N0s)){ 

#}
#plot(sad3)
#plot(ipd3)

