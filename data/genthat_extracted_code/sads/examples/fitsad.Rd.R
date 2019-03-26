library(sads)


### Name: fitsad
### Title: ML fitting of species abundance distributions
### Aliases: fitsad fitbs fitgamma fitgeom fitlnorm fitls fitmzsm fitnbinom
###   fitpareto fitpoilog fitpower fitpowbend fitvolkov fitweibull

### ** Examples


## Magurran (1989) example 5:
## birds in an Australian forest
mag5 <- c(103, 115, 13, 2, 67, 36, 51, 8, 6, 61, 10, 21,
          7, 65, 4, 49, 92, 37, 16, 6, 23, 9, 2, 6, 5, 4, 
          1, 3, 1, 9, 2)
mag5.bs <- fitsad(mag5, "bs") 
summary(mag5.bs)## no estimated coefficient
coef(mag5.bs) ## fixed coefficients N and S
## Diagnostic plots
par(mfrow=c(2, 2))
plot(mag5.bs)
par(mfrow=c(1, 1))


data(moths) #Fisher's moths data
moths.mzsm <- fitmzsm(moths) ## same as fitsad(moths, sad="mzsm")
## fit to log-series
moths.ls <- fitsad(moths, sad="ls")
coef(moths.ls)
coef(moths.mzsm) ## Compare with theta=38.9, Alonso&McKanne (2004)
## Diagnostic plots
par(mfrow=c(2, 2))
plot(moths.mzsm)
par(mfrow=c(1, 1))
## Graphical comparison
plot(rad(moths))
lines(radpred(moths.ls))
lines(radpred(moths.mzsm), col="red", lty=2)
legend("topright", c("log-series", "mZSM"), lty=1, col=c("blue","red"))
## Two more models: truncated lognormal and Poisson-lognormal
moths.ln <- fitsad(moths, "lnorm", trunc=0.5)
moths.pln <- fitsad(moths, "poilog")
## Model selection
AICtab(moths.ln, moths.pln, moths.ls, moths.mzsm, weights=TRUE)

## Biomass as abundance variable
data(ARN82.eB.apr77) #benthonic marine animals
AR.ln <- fitsad(ARN82.eB.apr77, sad="lnorm")
AR.g <- fitsad(ARN82.eB.apr77, sad="gamma")
AR.wb <- fitsad(ARN82.eB.apr77, sad="weibull")
plot(octav(ARN82.eB.apr77))
lines(octavpred(AR.ln))
lines(octavpred(AR.g), col="red")
lines(octavpred(AR.wb), col="green")
legend("topright", c("lognormal", "gamma", "weibull"),lty=1, col=c("blue","red", "green"))
AICctab(AR.ln, AR.g, AR.wb, nobs=length(ARN82.eB.apr77), weights=TRUE) 



