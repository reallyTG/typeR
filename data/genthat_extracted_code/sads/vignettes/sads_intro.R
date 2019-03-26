### R code from vignette source 'sads_intro.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: R setup
###################################################
options(width=60, continue=" ")


###################################################
### code chunk number 2: installation (eval = FALSE)
###################################################
## install.packages('sads')


###################################################
### code chunk number 3: load-sads
###################################################
library(sads)


###################################################
### code chunk number 4: install-dev-version (eval = FALSE)
###################################################
## library(devtools)
## install_github(repo = 'piLaboratory/sads', ref= 'dev', build_vignettes = TRUE)


###################################################
### code chunk number 5: load-sads-package
###################################################
library(sads)


###################################################
### code chunk number 6: Loading datasets
###################################################
data(moths)# William's moth data used by Fisher et al (1943)
data(ARN82.eB.apr77)# Arntz et al. benthos data
data(birds)# Bird census used by Preston (1948)


###################################################
### code chunk number 7: Tabulating species in octaves
###################################################
(moths.oc <- octav(moths))
(arn.oc <- octav(ARN82.eB.apr77))


###################################################
### code chunk number 8: Ploting-octaves
###################################################
plot(moths.oc)


###################################################
### code chunk number 9: Biomass-octave-plot
###################################################
plot(arn.oc)


###################################################
### code chunk number 10: octaves-relative-frequencies
###################################################
plot(moths.oc, prop = TRUE, border=NA, col=NA)
lines(octav(birds), mid = FALSE, prop = TRUE, col="red")
lines(octav(moths), mid = FALSE, prop = TRUE)
legend("topright", c("Preston's birds", "Fisher's moths"), col=c("red", "blue"), lty=1, bty="n")


###################################################
### code chunk number 11: Rank-abundance tables
###################################################
head(moths.rad <- rad(moths))
head(arn.rad <- rad(ARN82.eB.apr77))


###################################################
### code chunk number 12: radplot1
###################################################
plot(moths.rad, ylab="Number of individuals")


###################################################
### code chunk number 13: radplots
###################################################
plot(arn.rad, ylab="Biomass")


###################################################
### code chunk number 14: rads-relative-abundances
###################################################
plot(moths.rad, prop = TRUE, type="n")
lines(rad(birds), prop = TRUE, col="red")
lines(rad(moths), prop = TRUE)
legend("topright", c("Preston's birds", "Fisher's moths"), col=c("red", "blue"), lty=1, bty="n")


###################################################
### code chunk number 15: Fitting a log-series model
###################################################
(moths.ls <- fitsad(moths,'ls'))


###################################################
### code chunk number 16: Operations on fitsad object
###################################################
summary(moths.ls)
coef(moths.ls)
logLik(moths.ls)
AIC(moths.ls)


###################################################
### code chunk number 17: Profiling and intervals
###################################################
moths.ls.prf <- profile(moths.ls)
likelregions(moths.ls.prf) #likelihood intervals
confint(moths.ls.prf)


###################################################
### code chunk number 18: Ploting-profiles
###################################################
par(mfrow=c(1,2))
plotprofmle(moths.ls.prf)# log-likelihood profile
plot(moths.ls.prf)# z-transformed profile
par(mfrow=c(1,1))


###################################################
### code chunk number 19: Plot-of-predicted-values
###################################################
par(mfrow=c(2,2))
plot(moths.ls)
par(mfrow=c(1,1))


###################################################
### code chunk number 20: Fitting two other models
###################################################
(moths.pl <- fitsad(x=moths, sad="poilog"))#default is zero-truncated
(moths.ln <- fitsad(x=moths, sad="lnorm", trunc=0.5)) # lognormal truncated at 0.5


###################################################
### code chunk number 21: Model selection table
###################################################
AICtab(moths.ls, moths.pl, moths.ln, base=TRUE)


###################################################
### code chunk number 22: Predicted values for octaves
###################################################
head(moths.ls.oc <- octavpred(moths.ls))
head(moths.pl.oc <- octavpred(moths.pl))
head(moths.ln.oc <- octavpred(moths.ln))


###################################################
### code chunk number 23: Octaves-plot
###################################################
plot(moths.oc)
lines(moths.ls.oc, col="blue")
lines(moths.pl.oc, col="red")
lines(moths.ln.oc, col="green")
legend("topright", 
       c("Logseries", "Poisson-lognormal", "Truncated lognormal"), 
       lty=1, col=c("blue","red", "green"))


###################################################
### code chunk number 24: Predicted values - radplots
###################################################
head(moths.ls.rad <- radpred(moths.ls)) 
head(moths.pl.rad <- radpred(moths.pl))
head(moths.ln.rad <- radpred(moths.ln))


###################################################
### code chunk number 25: Rad-plots
###################################################
plot(moths.rad)
lines(moths.ls.rad, col="blue")
lines(moths.pl.rad, col="red")
lines(moths.ln.rad, col="green")
legend("topright", 
       c("Logseries", "Poisson-lognormal", "Truncated lognormal"), 
       lty=1, col=c("blue","red", "green"))


###################################################
### code chunk number 26: rsad-example1
###################################################
set.seed(42)# fix random seed to make example reproducible
(samp1 <- rsad(S = 10, frac = 0.1, sad = "lnorm", 
               coef=list(meanlog = 3, sdlog = 1.5),
               zeroes=TRUE, ssize = 2))


###################################################
### code chunk number 27: rsad-example2
###################################################
(samp2 <- rsad(S = 100, frac=0.1, sad="lnorm", 
               list(meanlog=5, sdlog=2)))


###################################################
### code chunk number 28: rsad-poilog-fit
###################################################
(samp2.pl <- fitsad(samp2, "poilog"))
## checking correspondence of parameter mu
coef(samp2.pl)[1] - log(0.1)


###################################################
### code chunk number 29: rsad-repeated-samples
###################################################
results <- matrix(nrow=75,ncol=2)
for(i in 1:75){
    x <- rsad(S = 100, frac=0.1, sad="lnorm", 
              list(meanlog=5, sdlog=2))
    y <- fitsad(x, "poilog")
    results[i,] <- coef(y)
}
results[,1] <- results[,1]-log(0.1)


###################################################
### code chunk number 30: rsads_bias
###################################################
##Mean of estimates
apply(results,2,mean)
## relative bias
(c(5,2)-apply(results,2,mean))/c(5,2)


###################################################
### code chunk number 31: rsads_bias
###################################################
##Mean of estimates
apply(results,2,sd)
## relative precision
apply(results,2,sd)/apply(results,2,mean)


###################################################
### code chunk number 32: rsads-bias-plots
###################################################
par(mfrow=c(1,2))
plot(density(results[,1]), main=expression(paste("Density of ",mu)))
abline(v=c(mean(results[,1]),5), col=2:3)
plot(density(results[,2]), main=expression(paste("Density of ",sigma)))
abline(v=c(mean(results[,2]), 2), col=2:3)
par(mfrow=c(1,1))


