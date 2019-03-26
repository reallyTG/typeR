library(secr)


### Name: ovensong
### Title: Ovenbird Acoustic Dataset
### Aliases: ovensong signalCH ovensong.model.1 ovensong.model.2
### Keywords: datasets

### ** Examples


summary(signalCH)
traps(signalCH)
signal(signalCH)

## apply signal threshold
signalCH.525 <- subset(signalCH, cutval = 52.5)

## Not run: 
##D ## models with and without spherical spreading
##D omask <- make.mask(traps(signalCH), buffer = 200)
##D ostart <- c(log(20), 80, log(0.1), log(2))
##D ovensong.model.1 <- secr.fit( signalCH.525, mask = omask, 
##D     start = ostart, detectfn = 11 ) 
##D ovensong.model.2 <- secr.fit( signalCH.525, mask = omask, 
##D     start = ostart, detectfn = 10 ) 
## End(Not run)

## compare fit of models
AIC(ovensong.model.1, ovensong.model.2)

## density estimates, dividing by 75 to allow for replication
collate(ovensong.model.1, ovensong.model.2)[1,,,"D"]/75

## plot attenuation curves cf Dawson & Efford (2009) Fig 5
pars1 <- predict(ovensong.model.1)[c("beta0", "beta1"), "estimate"]
pars2 <- predict(ovensong.model.2)[c("beta0", "beta1"), "estimate"]
attenuationplot(pars1, xval=0:150, spherical = TRUE, ylim = c(40,110))
attenuationplot(pars2, xval=0:150, spherical = FALSE, add = TRUE, 
    col = "red")
## spherical spreading only
pars1[2] <- 0  
attenuationplot(pars1, xval=0:150, spherical = TRUE, add = TRUE, lty=2)




